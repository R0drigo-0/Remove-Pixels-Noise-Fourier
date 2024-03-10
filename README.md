# Remove Pixels Noise Fourier
A 2D fast Fourier transform (FFT) is performed on the image. Subsequently, the zero frequency component is shifted to the center of the spectrum. The image is filtered in the frequency domain by multiplying the Fourier transform with the circular mask, removing high spatial frequencies. Finally, the Fourier transform is inverted to obtain the filtered image, with the high frequencies attenuated.

## Before & After Processing
<div align="center">
<img src="assets/Fourier.png">
</div>