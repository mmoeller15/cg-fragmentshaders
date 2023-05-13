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
    
    float gray = 0.299*color.r + 0.587*color.g + 0.114*color.b;

    vec3 outline = vec3(length(vec2(dFdx(gray), dFdy(gray))));

    // ALTERNATIVE: for thicker lines
    //vec3 outline = vec3(step(0.035, length(vec2(dFdx(gray), dFdy(gray)))));

    FragColor = vec4(outline, 1.0);

    // ALTERNATIVE: to overlay backover picture - makes look like comic
    //FragColor = vec4(color.rgb - outline, 1.0);
}
