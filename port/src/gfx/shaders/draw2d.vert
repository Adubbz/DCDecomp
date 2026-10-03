#version 460

// Logical 2D: x, y in the target's logical space, z the depth (1 near, 0 far).

layout(location = 0) in vec3 a_position;
layout(location = 1) in vec2 a_uv;
layout(location = 2) in vec4 a_color;
layout(location = 3) in float a_fog;

layout(push_constant, std430) uniform Push {
    vec4 xform;
    vec4 uv_xform;
    uint texture_slot;
    uint palette_slot;
    uint sampler_slot;
    uint flags;
    uint alpha;
    uint fog_color;
}
pc;

layout(location = 0) out vec4 v_color;
layout(location = 1) out vec2 v_uv;
layout(location = 2) out float v_fog;

void main() {
    gl_Position = vec4(a_position.xy * pc.xform.xy + pc.xform.zw, a_position.z, 1.0);
    v_color     = a_color;
    v_uv        = a_uv * pc.uv_xform.xy + pc.uv_xform.zw;
    v_fog       = a_fog;
}
