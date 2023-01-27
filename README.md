# PNTrianglesQuads

vcpkg installation - https://github.com/microsoft/vcpkg/blob/master/README.md

cmake installation - https://cmake.org/install/

Demo - Demo.webm file

## Project - Surface Subdivision and Tessellation

### Set up

-   Draw a 600x600 window and set the title to "Yourname".
-   Use  **Perspective**  projection, set the field of view angle to be 45 degree, near plane to be 0.1 and far plane to be 100.
-   **Camera movements from Project 2**: Use  **←**  and  **→**  keys move the camera along the blue circle parallel to the equator.  **↑**  and  **↓**  keys rotate the camera along the red circle orthogonal to the equator. Point the camera always to the origin. Choose a good "up" direction.
-   The  r  key resets the program to its startup state (displays x-y plane, clear rotations, etc.).

### Task 1: Display face geometry as a(n irregular) quad mesh

-   Create or find a low poly human head consisting of 3- and 4-sided facets and import it into your openGL program.
-   The  f  key toggles show/hide of the  _wireframe_ of the model (show no facets yet!)
    
### Task 2: Add a texture    
   - Take a photo of your face
    -   Map the photo onto the quad facets of the mesh
    -   The  F  key toggles show/hide of the facetted (Frankenstein) head with texture
    
### Task 3: Render a smooth surface
   -   Apply  [PN triangles](https://www.cise.ufl.edu/research/SurfLab/papers/00ati.pdf) and  [PN quads](https://www.cise.ufl.edu/research/SurfLab/papers/1008PNquad.pdf) to the mesh
    -   The  P  key toggles show/hide of the smoothly rendered head ( = with sufficiently high sample level)
    -   uv-map your face texture onto the front of the curved surface PN quad head model.
    -   The  u  key toggles show/hide of the texture.
    
   ### _BONUS:_
-   Use the tessellation engine for Task 3.
