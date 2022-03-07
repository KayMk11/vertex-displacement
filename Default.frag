#version 330 core
out vec4 FragColor;

uniform sampler2D texture_diffuse1;

void main()
{    
    FragColor = texture(texture_diffuse1, gl_TexCoord[0].xy);
}