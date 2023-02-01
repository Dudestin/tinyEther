# tinyEther
技術書展13(2022/9/10 ~ 9/25) にて頒布した『FPGAによるネットワーク機器完全自作実践』のサポートリポジトリです。

## 動作確認環境
- Anlogic Tang Dynasty Ver. 4.4.433
- riscv32-unknown-elf-gcc (g5964b5cd727) 11.1.0

## 関連事項
本実験ボードを用いたUDPによるネットワーク映像転送デモは下記のリポジトリにて公開中です.   
なお, この実装には別のオープンソースのネットワークハードウェア実装を利用しています. ご了承ください.   
https://github.com/Dudestin/udp_camera_streaming

## tinyFastEtherDeveloper 
**BOOTHにて頒布中です**  
https://booth.pm/ja/items/4174064

10cm四方の小型Ethernet実験ボード. 
Tang PriMERと併せてご利用ください. 

### 電源ユニット

DC5V, 最大2A出力可能のものをご利用ください。  
下記のものなどをご利用になれます。

- https://akizukidenshi.com/catalog/g/gM-11996/
- https://akizukidenshi.com/catalog/g/gM-01801/
- https://akizukidenshi.com/catalog/g/gM-08311/

### PHY (RTL8201F)の詳細情報

以下のリンクからデータシートを参照できます.  
https://www.verical.com/datasheet/realtek-semiconductor-phy-rtl8201f-vb-cg-2635458.pdf

#### MDIOバスに関する注意事項
PHYアドレス0はブロードキャストアドレスとなっており、すべてのPHYチップが受信し処理します。  
これによりすべてのPHYを対象に一度にレジスタに書き込むことができます。  
一方でPHY0のレジスタのみ読みたい場合、すべてのPHYが応答してしまい正常に読み出すことができません。  
PHY0のレジスタを読み出したい場合、次の手順を踏む必要があります。

1. PHY1~3のリセット状態を保持する.
2. PHY0のレジスタを読み込む.
3. PHY1~3のリセット状態を解除する.

## 質問等
不明点等ありましたら，お気軽にIssueをください。
