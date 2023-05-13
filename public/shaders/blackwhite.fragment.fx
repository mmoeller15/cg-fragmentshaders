#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;

// Output
out vec4 FragColor;

void main() {
    // Color
    vec4 color = texture(image, model_uv);

    // Luminance is calculated as L = 0.299 * Red + 0.587 * Green + 0.114 * Blue
    // Black and white images are created by assigning the luminance value to all 3 color components
    float luminance = 0.299*color.r + 0.587*color.g + 0.114*color.b;
    FragColor = vec4(luminance + 0.0*color.rgb, 1.0);
}
