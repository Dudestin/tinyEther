# リピータートップモジュール
リピーターを構成するトップモジュール.
各PHYの`REF_CLK`はデフォルトでは独立なので
緩衝バッファとなる非同期式FIFOを挟まなければならなりません.

## 仕様モジュール一覧

### `common/rtl/RMII_RX.v`
RMII 受信モジュール, 100BASE-TX + 全二重通信を前提としたもの。

### `common/rtl/RMII_TX.v`
RMII 送信モジュール, 100BASE-TX + 全二重通信を前提としたもの。

### `common/rtl/FRAME_FIFO.v`
EOD (デリミタ信号), `frame_exist` (フレーム存在信号), `half_flag` (半分占有信号)
を備えた非同期式FIFO. BRAM9k 1個 とBRAM32k 2個を用います。

## 制約ファイル

### `repeater/constraints/io_12.adc`
ポート0とポート1間のリピーターを用いる際のIO制約。

### `repeater/constraints/io_23.adc`
ポート2とポート3間のリピーターを用いる際のIO制約。

### `repeater/constraints/timing.sdc`
タイミング制約。上記の２つのIO制約において共通して利用できます。
