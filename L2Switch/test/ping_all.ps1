$NIC_LIST = @('169.254.161.37','169.254.116.116', '169.254.191.252', '169.254.39.31')

for ($i=0; $i -lt 4; $i++){
  for ($j=$i+1; $j -lt 4; $j++) {
    ping -S $NIC_LIST[$i] $NIC_LIST[$j] -n 1
    Start-Sleep -Seconds 0.6
  }
}
