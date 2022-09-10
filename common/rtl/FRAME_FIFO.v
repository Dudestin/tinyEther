// My original asynchronous FIFO
// using BRAM32k x 2, BRAM9k x 1
// 8192 Words Depth (~= 5.5 full-frame)
// |       BRAM9K       (1-bit) | for delimiter (EOD)
// |  BRAM32K + BRAM32K (8-bit) | for data

module FRAME_FIFO #(
           parameter integer AEMPTY_CNT=1514, // Ethernet MTU
           parameter integer AFULL_CNT =6660,  // ~= 8192 - MTU
           parameter integer HALF_CNT  =4096  // = 8192 / 2
       )(
           arst_n,
           di, clkw, we,
           do, clkr, re,
           empty_flag, aempty_flag,
           full_flag, afull_flag,
           // my original signal
           half_flag, // half of FIFO occupied, useful to implement smart schedular
           EOD_in, EOD_out,
           frame_exist
       );
localparam integer WA=13;
localparam integer WD=8;

input wire clkw, we;
input wire clkr,re;
input wire arst_n;
wire rst_n_r, rst_n_w;
sync_2ff rst_r_sync(.clk(clkr), .din(arst_n), .dout(rst_n_r));
sync_2ff rst_w_sync(.clk(clkw), .din(arst_n), .dout(rst_n_w));

input wire [WD-1:0] di;

output wire [WD-1:0] do;
output reg  afull_flag, aempty_flag;
output reg  full_flag, empty_flag;
output reg  half_flag;
// my original signal
input  wire EOD_in;
output wire EOD_out;
output reg  frame_exist;

reg[WA:0] wadr;
reg[WA:0] radr;

wire [WD-1:0] rdat_0;
bram32k #(.DATA_WIDTH(WD)) bram32k_impl_0
        (
            .doa(),       .dia(di),   .addra(wadr[WA-2:0]), .clka(clkw), .wea(we &~wadr[WA-1]), .rsta(~rst_n_w),
            .dob(rdat_0), .dib(8'bz), .addrb(radr_next[WA-2:0]), .clkb(clkr), .web(1'b0), .rstb(~rst_n_r)
        );

wire [WD-1:0] rdat_1;
bram32k #(.DATA_WIDTH(WD)) bram32k_impl_1
        (
            .doa(),       .dia(di),   .addra(wadr[WA-2:0]), .clka(clkw), .wea(we & wadr[WA-1]), .rsta(~rst_n_w),
            .dob(rdat_1), .dib(8'bz), .addrb(radr_next[WA-2:0]), .clkb(clkr), .web(1'b0), .rstb(~rst_n_r)
        );

assign do = (radr[WA-1] == 1'b0) ? rdat_0 : rdat_1;

/* store delimiters(EOD) */
wire raw_EOD_out;
bram9k bram9k_impl (
           .doa(), 	   .dia(EOD_in), .addra(wadr[WA-1:0]), .clka(clkw), .wea(we),  .rsta(~rst_n_w),
           .dob(raw_EOD_out), .dib(1'bz),   .addrb(radr_next[WA-1:0]), .clkb(clkr),  .web(1'b0), .rstb(~rst_n_r)
       );
// to mask old EOD value when fifo is empty
assign EOD_out = empty_flag ? 1'b0 : raw_EOD_out;


/*********************************************************
* wclk domain
********************************************************/
/* write address */
reg  [WA:0] radr_gray;

reg  [WA:0] wadr_gray;

wire [WA:0] wadr_next = wadr + (we & ~full_flag);
wire [WA:0] wadr_gray_next = wadr_next ^ (wadr_next >> 1'b1);

always @(posedge clkw)
begin
    if (~rst_n_w)
    begin
        wadr      <= {(WA+1){1'b0}};
        wadr_gray <= {(WA+1){1'b0}};
    end
    else
    begin
        wadr      <= wadr_next;      // bin
        wadr_gray <= wadr_gray_next; // gray
    end
end

/* eod counter */
reg [7:0] weod;
reg [7:0] weod_gray;
wire [7:0] weod_next = weod + (we & EOD_in & ~full_flag);
wire [7:0] weod_gray_next = weod_next ^ (weod_next >> 1'b1);

always @(posedge clkw)
begin
    if (~rst_n_w)
    begin
        weod      <= 8'b0;
        weod_gray <= 8'b0;
    end
    else
    begin
        weod      <= weod_next;      // bin
        weod_gray <= weod_gray_next; // gray
    end
end


/* 2FF-sync of rptr */
wire [WA:0] radr_gray_sync;
vec_sync_2ff #(WA+1) sync_0 (.clk(clkw), .din(radr_gray), .dout(radr_gray_sync));

/* full flag @ write clock */
wire [WA:0] radr_sync;
my_gray2bin #(.WIDTH(WA+1)) gray2bin_impl0 (.din(radr_gray_sync), .dout(radr_sync));

always @(posedge clkw)
begin
    if(~rst_n_w)
        full_flag <= 1'b0;
    else
        full_flag <= (wadr_next[WA:0] == {~radr_sync[WA], radr_sync[WA-1:0]});
end

/* also full flag @ write clock */
wire [WA:0] diff_adr_w
     = {radr_sync[WA] ^ wadr_next[WA], wadr_next[12:0]} - {1'b0, radr_sync[12:0]};

always @(posedge clkw)
begin
    if(~rst_n_w)
        afull_flag <= 1'b0;
    else
        afull_flag <= (diff_adr_w >= AFULL_CNT);
end

/* half fill flag @ write clock */
always @(posedge clkw)
begin
    if (~rst_n_r)
        half_flag <= 1'b0;
    else
        half_flag <= (diff_adr_w >= HALF_CNT);
end

/*********************************************************
* rclk domain
********************************************************/
/* read address */


wire [WA:0] radr_next = radr + (re & ~empty_flag);
wire [WA:0] radr_gray_next = radr_next ^ (radr_next >> 1'b1);

always @(posedge clkr)
begin
    if (~rst_n_r)
    begin
        radr      <= {(WA+1){1'b0}};
        radr_gray <= {(WA+1){1'b0}};
    end
    else
    begin
        radr      <= radr_next;      // bin
        radr_gray <= radr_gray_next; // gray
    end
end

/* eod counter */
reg [7:0] reod;
reg [7:0] reod_gray;
wire [7:0] reod_next = reod + (re & EOD_out & ~empty_flag);
wire [7:0] reod_gray_next = reod_next ^ (reod_next >> 1'b1);

always @(posedge clkr)
begin
    if (~rst_n_r)
    begin
        reod      <= 8'b0;
        reod_gray <= 8'b0;
    end
    else
    begin
        reod      <= reod_next;      // bin
        reod_gray <= reod_gray_next; // gray
    end
end

/* 2FF-sync of wptr */
wire [WA:0] wadr_gray_sync;
vec_sync_2ff #(WA+1) sync_1 (.clk(clkr), .din(wadr_gray), .dout(wadr_gray_sync));

/* empty flag @ read clock */
wire [WA:0] wadr_sync;
my_gray2bin #(.WIDTH(WA+1)) gray2bin_impl1 (.din(wadr_gray_sync), .dout(wadr_sync));

always @(posedge clkr)
begin
    if(~rst_n_r)
        empty_flag <= 1'b1;
    else
        empty_flag <= (radr_next == wadr_sync);
end

/* also empty flag @ read clock */
wire [WA:0] diff_adr_r
     = {wadr_sync[WA] ^ radr_next[WA], wadr_sync[12:0]} - {1'b0, radr_next[12:0]};

always @(posedge clkr)
begin
    if(~rst_n_r)
        aempty_flag <= 1'b1;
    else
        aempty_flag <= (diff_adr_r <= AEMPTY_CNT);
end

/* 2FF-sync of weod */
wire [7:0] weod_gray_sync;
vec_sync_2ff #(.WIDTH(8)) weod_sync_impl (.clk(clkr), .din(weod_gray), .dout(weod_gray_sync));

/* frame exist flag @ read clock */
wire [7:0] weod_sync;
my_gray2bin #(.WIDTH(8)) weod_gray2bin_impl1 (.din(weod_gray_sync), .dout(weod_sync));

always @(posedge clkr)
begin
    if(~rst_n_r)
        frame_exist <= 1'b0;
    else
        frame_exist <= (reod_next != weod_sync);
end

endmodule
