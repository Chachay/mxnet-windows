#Write-Output "Downloading CUDA toolkit 11.3. ..."
#Invoke-WebRequest https://developer.download.nvidia.com/compute/cuda/11.3.0/network_installers/cuda_11.3.0_win10_network.exe -OutFile setup.exe | Out-Null
#Write-Output "Installing CUDA toolkit 11.3 ..."
#Start-Process -Wait -FilePath .\setup.exe -ArgumentList "-s nvcc_11.3 cublas_11.3 cublas_dev_11.3 cudart_11.3 curand_11.3 curand_dev_11.3 nvml_dev_11.3 visual_studio_integration_11.3"
#if (!$?) {
#  Write-Output "CUDA Install Error: $($LASTEXITCODE)"
#  exit 1
#}

Write-Output "Downloading cudnn"
Invoke-WebRequest https://developer.download.nvidia.com/compute/redist/cudnn/v8.4.1/local_installers/11.6/cudnn-windows-x86_64-8.4.1.50_cuda11.6-archive.zip -OutFile cudnn.zip | Out-Null

if(Test-Path -Path ".\cudnn.zip"){
  Write-Output "Completed"
} else {
  Write-Output "Failed to download"
  exit 1
}
Expand-Archive -Path cudnn.zip -DestinationPath "d:\a\cudnn"

Copy-Item -Path "d:\a\cudnn\cudnn-windows-x86_64-8.4.1.50_cuda11.6-archive\bin\*.*" -Destination "$($Env:ProgramFiles)\NVIDIA GPU Computing Toolkit\CUDA\v11.3\bin"
Copy-Item -Path "d:\a\cudnn\cudnn-windows-x86_64-8.4.1.50_cuda11.6-archive\lib\*.*" -Destination "$($Env:ProgramFiles)\NVIDIA GPU Computing Toolkit\CUDA\v11.3\lib"
Copy-Item -Path "d:\a\cudnn\cudnn-windows-x86_64-8.4.1.50_cuda11.6-archive\include\*.*" -Destination "$($Env:ProgramFiles)\NVIDIA GPU Computing Toolkit\CUDA\v11.3\include"

#Write-Output "CUDA Installation completed "

#$env:CUDA_PATH = "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v11.3"
#echo "CUDA_PATH=$env:CUDA_PATH" | Out-File -FilePath $env:GITHUB_ENV -Encoding utf8 -Append
#echo "$env:CUDA_PATH/bin" | Out-File -FilePath $env:GITHUB_PATH -Encoding utf8 -Append
