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
    vec3 new_color = round(color.rgb * 4.0) / 4.0;

    FragColor = vec4(new_color, 1.0);
}
