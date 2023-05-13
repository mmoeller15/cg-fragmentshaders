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

    vec2 tex_coord = (model_uv*2.0) - 1.0;
    float theta = atan(tex_coord.y, tex_coord.x);
    float radius = pow(length(tex_coord), 1.5);
    vec2 fish_eye_coord = vec2(radius*cos(theta), radius*sin(theta));
    vec2 final_coord = 0.5*(fish_eye_coord + 1.0);

    FragColor = texture(image, final_coord);
}
