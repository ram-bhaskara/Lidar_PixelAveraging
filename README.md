# Lidar_PixelAveraging
## Pixel averaging functions

Computer vision programs for estimating 3d coordinates would often result in floating point (u,v) coordinates. 
In such a case, it is necessary to be able to identify the positive integer pixel coordinates and in some cases it might help to average pixels in the neighborhood to appropriately capture intended information.

The above functions are written to first identify pixel centroid by computing minimum distance. Once the pixel boundaries are known, we can compute average values of the pixels in its neighborhood in a pattern that best minimizes the error. 

5 example patterns are written: 

1) unweighted 3*3 grid pixel masking
2) weighted 3*3 grid pixel masking
3) plus pattern averaging 
4) cross pattern averaging
5) 2*2 grid pixel averaging

All these functions are similar except 2*2 grid averaging which involves an additional step of computing the best four pixels to average based on the quadrant to which the floating point (u,v) belongs. 

Inputs: pixel coordinates (u,v) & (x,y,z) 3d coordinates that each pixel of defined resolution can point to.

Outputs: Average values of (x,y,z) 3d coordinates according to the pattern of interest.
