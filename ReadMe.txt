---------------------------------------------------------------------------------------
Copyright @ Akhilesh Ravi 16110007 DIP Assignment 3 Question 3
---------------------------------------------------------------------------------------
Implementation of various binarization, halftoning and error diffusion function.
This aim of this program is to convert a greyscale image to a monochrome image and make it appear as if it is a greyscale image having various pixel intensities using various methods. This happens because our eye averages the region around a pixel.

f, f1, g, g1, g2, g3, g4, g5, g6 - It should be greyscale image (2D matrix)
This should be the format for the functions.
In the main program, main.m, the input image can be a colour image. It should be of .jpg type (other than campus.png)

THE OUTCOMES MAY NOT BE AS EXPECTED OR ERRORS MAY OCCUR IF THE INPUTS ARE NOT OF THE SPECIFIED FORM.


main.m
	This program runs all the functions given below on a given image and returns the outputs for them all. It also runs the fidelity() function and checks the fidelity for the output monochrome images.



threshold_161100007(f)
	Thresholding the greyscale image
	This function directly thresholds the greyscale image and converts it into a monochrome image (threshold, T = 127)
	
	Input Argument
	f - Input Image
	
	Output Argument
	g1 - Input Image after Binarization
	
	
noiser_16110007(f)	
	Random Noise Binarization
	Random noise in the range [-128 128] and then, the threshold is introduced
	for binarization.

	Input Argument
	f - Input Image
	
	Output Arguments
	f1 - Input Image after adding Noise
	g2 - f1 after Binarization
	
	
halftone_16110007(f)
	Halftoning using dither matrices
	This function halftones the input image by using a dither matrix of a
	given size.
	
	Input Argument
	f - Input Image
	
	Output Arguments
	g3 - Output image (input image halftoned by 2x2 dither matrix)
	g4 - Output image (input image halftoned by 4x4 dither matrix)
	g5 - Output image (input image halftoned by 8x8 dither matrix)

	
error_diffusion_16110007(f)
	Error Diffusion
	We go pixel by pixel and binarize it using the threshold (T = 127). We check the error of the pixel after thresholding with respect to the original image. We scale this error and add it to neighbouring pixels using a scaling matrix.
	
	Input Argument
	f - Input Image
	
	Output Argument
	g6 - Output image (input image after error diffusion)
	
	
fidelity_16110007(f, g)
	Fidelity Metrics
	Function to find out the fidelity of an image (monochrome) with respect to the original image using various metrics. Here we compare how close the two images appear to be.
	
	Input Argument
	f - Input Reference Image
	g - Input Image
	
	Output Arguments
	a1 - Mean of deviation
	a2 - Mean of absolute deviation
	a3, a4 - Mean of Absolute Deviation after transforming using gamma
	a5, a6 - Mean of Absolute Deviation after applying gamma transformation and then applying a Low Pass Filter