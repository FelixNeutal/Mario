#type vertex
#version 330 core
layout (location=0) in vec3 aPos;
layout (location=1) in vec4 aColor;
layout (location=2) in vec2 aTexCoords;

uniform mat4 uProjection;
uniform mat4 uView;

out vec4 fColor;
out vec2 fTextCoords;

void main() {
    fColor = aColor;
    fTextCoords = aTexCoords;
//    gl_Position = vec4(aPos, 1.0);
    gl_Position = uProjection * uView * vec4(aPos, 1.0);
}

#type fragment
#version 330 core

uniform float uTime;
uniform sampler2D TEX_SAMPLER;
in vec2 fTextCoords;
in vec4 fColor;
out vec4 color;

void main() {
    color = texture(TEX_SAMPLER, fTextCoords);
}

