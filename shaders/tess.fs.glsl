#version 440 core

struct FragData
{
    vec3 position;
    vec3 normal;
    vec4 color;
    vec2 uv;
};

in vec3 position_worldspace;
in vec3 normal_cameraspace;
in vec3 eyeDirection_cameraspace;
in vec3 lightDirection_cameraspace[2];
in FragData fragdata;
out vec3 color;

uniform vec3 lightPosition_worldspace[2];
uniform highp sampler2D myTextureSampler;

void main() {
    vec3 lightColor = vec3(1,1,1);
	float lightPower = 100.f;

    vec3 materialDiffuseColor = texture( myTextureSampler, fragdata.uv ).rgb;
    //vec3 materialDiffuseColor = fragdata.color.rgb;
    vec3 materialAmbientColor = vec3(0.5, 0.5, 0.5) * materialDiffuseColor;
    vec3 materialSpecularColor = vec3(0.1, 0.1, 0.1);

    vec3 res;

	for(int i = 0; i < 2; i++) {
		float distance = length( lightPosition_worldspace[i] - position_worldspace );

		vec3 n = normalize( normal_cameraspace );
		vec3 l = normalize( lightDirection_cameraspace[i] );
		float cosTheta = clamp( dot( n,l ), 0,1 );
	
		vec3 E = normalize(eyeDirection_cameraspace);
		vec3 R = reflect(-l,n);
		float cosAlpha = clamp( dot( E,R ), 0,1 );
	
		res += materialAmbientColor + 
			materialDiffuseColor * lightColor * lightPower * cosTheta / (distance*distance) +
			materialSpecularColor * lightColor * lightPower * pow(cosAlpha,5) / (distance*distance);
	}

	color = res;
}
