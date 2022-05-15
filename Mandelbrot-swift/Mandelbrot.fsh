void main() {
    #define iterations 256

    vec2 position = v_tex_coord; // gets the location of the current pixel in the intervals [0..1] [0..1]
    vec3 color = vec3(0.0,0.0,0.0); // initialize color to black

    vec2 z = position; // z.x is the real component z.y is the imaginary component


    // Rescale the position to the intervals [-2,1] [-1,1]
    //z *= vec2(2.0,2.0);
    z -= vec2(0.5,0.5);

    //vec2 c = z;
    //vec2 c = vec2(-0.7,0.4);
    vec2 c = vec2(-0.7 + cos(u_time) / 31.0,0.4 + sin(u_time) / 33.0);
    
    float it = 0.0; // Keep track of what iteration we reached
    for (int i = 0;i < iterations; ++i) {
        // zn = zn-1 ^ 2 + c

        // (x + yi) ^ 2 = x ^ 2 - y ^ 2 + 2xyi
        z = vec2(z.x * z.x - z.y * z.y, 2.0 * z.x * z.y);
        z += c;

        if (dot(z,z) > 4.0) { // dot(z,z) == length(z) ^ 2 only faster to compute
            break;
        }

        it += 1.0;
    }

    if (it < float(iterations)) {
        color.x = sin(it / 3.0);
        color.y = cos(it / 6.0);
        color.z = cos(it / 12.0 + 3.14 / 4.0);
    }

    gl_FragColor = vec4(color,1.0);
}
