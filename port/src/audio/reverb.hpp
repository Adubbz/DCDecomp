#pragma once

#include <vector>

namespace audio {

// An approximation of the SPU2 effect unit: its ten modes become comb/allpass rooms of growing
// size, or plain delay lines for the echo, delay and pipe modes. Nothing here models the
// hardware's work area.
class Reverb {
public:
    static constexpr int kModes = 10;

    explicit Reverb(int rate);

    void SetMode(int mode);

    void SetDepth(float depth) { depth_ = depth; }

    bool Active() const { return mode_ != 0 && depth_ > 0.0f; }

    // Adds the wet signal of in to out, both interleaved stereo.
    void Process(const float *in, float *out, int frames);

    void Clear();

private:
    struct Comb {
        std::vector<float> buffer;
        std::size_t        index = 0;
        float              filter = 0.0f;
    };

    struct Allpass {
        std::vector<float> buffer;
        std::size_t        index = 0;
    };

    int                  rate_;
    int                  mode_ = 0;
    float                depth_ = 0.0f;
    float                feedback_ = 0.0f;
    float                damp_ = 0.0f;
    bool                 delay_ = false;
    std::vector<Comb>    combs_[2];
    std::vector<Allpass> allpasses_[2];
};

} // namespace audio
