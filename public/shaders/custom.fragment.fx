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
    //FragColor = texture(image, model_uv);


    float gray = length(color.rgb);
    FragColor = vec4(vec3(step(0.06, length(vec2(dFdx(gray), dFdy(gray))))), 1.0);//vec4(vec3(step(0.1, gray)), 1.0);
}
