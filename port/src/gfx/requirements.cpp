#include "requirements.hpp"

#include <algorithm>
#include <cstring>

#include "context.hpp"

namespace gfx::detail {

namespace {

bool DepthStencilUsable(VkPhysicalDevice device, VkFormat format) {
    VkFormatProperties properties;
    vkGetPhysicalDeviceFormatProperties(device, format, &properties);
    VkFormatFeatureFlags needed = VK_FORMAT_FEATURE_DEPTH_STENCIL_ATTACHMENT_BIT |
                                  VK_FORMAT_FEATURE_TRANSFER_SRC_BIT | VK_FORMAT_FEATURE_TRANSFER_DST_BIT;
    return (properties.optimalTilingFeatures & needed) == needed;
}

std::string Version(uint32_t version) {
    return std::to_string(VK_API_VERSION_MAJOR(version)) + "." + std::to_string(VK_API_VERSION_MINOR(version));
}

} // namespace

DeviceCaps QueryDeviceCaps(VkPhysicalDevice device, VkSurfaceKHR surface) {
    DeviceCaps caps;

    uint32_t count = 0;
    vkEnumerateDeviceExtensionProperties(device, nullptr, &count, nullptr);
    std::vector<VkExtensionProperties> extensions(count);
    vkEnumerateDeviceExtensionProperties(device, nullptr, &count, extensions.data());
    for (const VkExtensionProperties &extension : extensions) {
        caps.extensions.emplace_back(extension.extensionName);
    }
    caps.portability_subset = HasExtension(caps, VK_KHR_PORTABILITY_SUBSET_EXTENSION_NAME);

    VkPhysicalDeviceProperties basic;
    vkGetPhysicalDeviceProperties(device, &basic);
    caps.api_version = basic.apiVersion;
    caps.limits = basic.limits;
    // Vulkan 1.2's structures are not to be chained on a 1.1 device; such a device is rejected anyway.
    if (caps.api_version >= VK_API_VERSION_1_2) {
        caps.portability = {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_FEATURES_KHR};
        caps.features13 = {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_3_FEATURES};
        caps.features13.pNext = caps.portability_subset ? &caps.portability : nullptr;
        caps.features12 = {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_2_FEATURES};
        caps.features12.pNext = caps.api_version >= VK_API_VERSION_1_3 ? static_cast<void *>(&caps.features13)
                                                                       : caps.features13.pNext;
        VkPhysicalDeviceFeatures2 features = {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FEATURES_2};
        features.pNext = &caps.features12;
        vkGetPhysicalDeviceFeatures2(device, &features);
        caps.features = features.features;

        caps.portability_properties = {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_PROPERTIES_KHR};
        caps.properties12 = {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_2_PROPERTIES};
        caps.properties12.pNext = caps.portability_subset ? &caps.portability_properties : nullptr;
        VkPhysicalDeviceProperties2 properties = {VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROPERTIES_2};
        properties.pNext = &caps.properties12;
        vkGetPhysicalDeviceProperties2(device, &properties);
        caps.features12.pNext = nullptr;
        caps.features13.pNext = nullptr;
        caps.properties12.pNext = nullptr;
    }

    caps.depth_stencil_format = DepthStencilUsable(device, VK_FORMAT_D32_SFLOAT_S8_UINT) ||
                                DepthStencilUsable(device, VK_FORMAT_D24_UNORM_S8_UINT);

    vkGetPhysicalDeviceQueueFamilyProperties(device, &count, nullptr);
    std::vector<VkQueueFamilyProperties> families(count);
    vkGetPhysicalDeviceQueueFamilyProperties(device, &count, families.data());
    for (uint32_t i = 0; i < count; i++) {
        VkBool32 present = VK_TRUE;
        if (surface != VK_NULL_HANDLE) {
            vkGetPhysicalDeviceSurfaceSupportKHR(device, i, surface, &present);
        }
        caps.graphics_queue = caps.graphics_queue || ((families[i].queueFlags & VK_QUEUE_GRAPHICS_BIT) && present);
    }
    return caps;
}

bool HasExtension(const DeviceCaps &caps, const char *name) {
    return std::ranges::find(caps.extensions, name) != caps.extensions.end();
}

std::vector<std::string> MissingRequirements(const DeviceCaps &caps, bool offscreen) {
    std::vector<std::string> missing;
    auto                     need = [&](bool present, const char *what) {
        if (!present) {
            missing.emplace_back(what);
        }
    };
    if (caps.api_version < VK_API_VERSION_1_3) {
        missing.push_back("Vulkan 1.3 (it has " + Version(caps.api_version) + ")");
        return missing;
    }
    if (!offscreen) {
        need(HasExtension(caps, VK_KHR_SWAPCHAIN_EXTENSION_NAME), VK_KHR_SWAPCHAIN_EXTENSION_NAME);
        need(caps.graphics_queue, "a graphics queue that presents to the window");
    } else {
        need(caps.graphics_queue, "a graphics queue");
    }
    need(caps.features.dualSrcBlend, "dualSrcBlend");
    need(caps.features.shaderClipDistance, "shaderClipDistance");
    need(caps.features.shaderSampledImageArrayDynamicIndexing, "shaderSampledImageArrayDynamicIndexing");
    need(caps.features12.descriptorBindingPartiallyBound, "descriptorBindingPartiallyBound");
    need(caps.features12.descriptorBindingSampledImageUpdateAfterBind, "descriptorBindingSampledImageUpdateAfterBind");
    need(caps.features12.descriptorBindingUpdateUnusedWhilePending, "descriptorBindingUpdateUnusedWhilePending");
    need(caps.properties12.maxPerStageDescriptorUpdateAfterBindSampledImages >= kMaxTextures &&
             caps.properties12.maxDescriptorSetUpdateAfterBindSampledImages >= kMaxTextures,
         "8192 update-after-bind sampled images (maxPerStageDescriptorUpdateAfterBindSampledImages, "
         "maxDescriptorSetUpdateAfterBindSampledImages)");
    need(caps.properties12.maxPerStageUpdateAfterBindResources >= kMaxTextures + kSamplerCount + 1,
         "maxPerStageUpdateAfterBindResources for the texture array");
    need(caps.features13.dynamicRendering, "dynamicRendering");
    need(caps.features13.synchronization2, "synchronization2");
    need(caps.limits.maxPushConstantsSize >= sizeof(PushConstants), "maxPushConstantsSize");
    need(caps.depth_stencil_format, "a D32_SFLOAT_S8_UINT or D24_UNORM_S8_UINT attachment");
    if (caps.portability_subset) {
        uint32_t alignment = std::max(caps.portability_properties.minVertexInputBindingStrideAlignment, 1u);
        need(sizeof(Vertex2D) % alignment == 0 && sizeof(Vertex3D) % alignment == 0,
             "vertex strides of 28 and 36 bytes (minVertexInputBindingStrideAlignment)");
    }
    return missing;
}

std::vector<std::string> PortabilityWorkarounds(const DeviceCaps &caps) {
    std::vector<std::string> workarounds;
    if (!caps.portability_subset) {
        return workarounds;
    }
    if (!caps.portability.triangleFans) {
        workarounds.emplace_back("triangle fans drawn as lists");
    }
    if (!caps.portability.separateStencilMaskRef) {
        workarounds.emplace_back("one stencil reference and mask pair for both faces");
    }
    return workarounds;
}

} // namespace gfx::detail
