$NIC_LIST = @('169.254.161.37','169.254.116.116', '169.254.191.252', '169.254.39.31')

for ($i=0; $i -lt 4; $i++){
  for ($j=$i+1; $j -lt 4; $j++) {
    iperf3 -B $NIC_LIST[$i] -c $NIC_LIST[$j] -t60
  }
}
