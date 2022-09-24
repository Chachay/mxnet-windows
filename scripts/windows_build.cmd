call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\VC\Auxiliary\Build\vcvars64.bat"
set OpenBLAS_HOME=D:\utils\OpenBLAS
set OpenCV_DIR=C:\tools\opencv\build
set CUDA_PATH="C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v10.3"
REM cd %~dp0\..\incubator-mxnet
REM cmake -G "Visual Studio 16 2019" ^
REM cmake -GNinja ^
cmake -GNinja ^
      -B "%~dp0..\incubator-mxnet\build" ^
      -DCMAKE_C_COMPILER=cl ^
      -DCMAKE_CXX_COMPILER=cl ^
      -DUSE_BLAS=open ^
      -DUSE_MKL_IF_AVAILABLE=OFF ^
      -DUSE_CUDA=ON ^
      -DUSE_CUDNN=ON ^
      -DENABLE_CUDA_RTC=ON ^
      -DUSE_OPENCV=ON  ^
      -DUSE_OPENMP=ON ^
      -DUSE_LAPACK=ON ^
      -DCMAKE_BUILD_TYPE:STRING=Release ^
      -DMXNET_CUDA_ARCH:STRING="8.6" ^
      "%~dp0..\incubator-mxnet"
REM   -A "x64" .
cmake --build "%~dp0..\incubator-mxnet\build"
if %ERRORLEVEL% NEQ 0 (
      cmake --build "%~dp0..\incubator-mxnet\build" -j1
)
