#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;
layout (location = 2) in vec2 aTexCoords;

out vec2 TexCoords;

uniform sampler2D displacementMap;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

void main()
{
    vec4 newVertexPos;
	vec4 dv;
	float df;

    gl_TexCoord[0].xy = aTexCoords;
    dv = texture(displacementMap, aTexCoords);
    df = 0.30*dv.x + 0.59*dv.y + 0.11*dv.z;
    newVertexPos = vec4(aNormal * df + aPos,1.0);

//    gl_Position = projection * view * model * vec4(newVertexPos);
    gl_Position = projection * view * model * vec4(aPos, 1.0);
}