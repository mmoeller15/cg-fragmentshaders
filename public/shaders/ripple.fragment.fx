#version 300 es
precision mediump float;

// Input
in vec2 model_uv;


// Uniforms
uniform sampler2D image;
uniform float time;

// Output
out vec4 FragColor;

void main() {
    // Color

    vec2 tex_coord = (model_uv*2.0) - 1.0;
    float radius = length(tex_coord);
    vec2 offset = tex_coord * (sin(radius * 30.0 - time * 5.0) + 0.5) / 60.0;
    vec2 final_coord = 0.5*(tex_coord + offset + 1.0);
    FragColor = texture(image, final_coord);
}
