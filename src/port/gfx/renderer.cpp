#include <SDL3/SDL.h>
#include <SDL3/SDL_vulkan.h>

#include <algorithm>
#include <cmath>
#include <cstdarg>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <string>
#include <vector>

#include "context.hpp"

namespace gfx {

namespace detail {

Context g;

void Fatal(const char *format, ...) {
    std::va_list args;
    va_start(args, format);
    std::fputs("gfx: ", stderr);
    std::vfprintf(stderr, format, args);
    std::fputc('\n', stderr);
    va_end(args);
    std::exit(1);
}

void Error(const char *format, ...) {
    std::va_list args;
    va_start(args, format);
    std::fputs("gfx: ", stderr);
    std::vfprintf(stderr, format, args);
    std::fputc('\n', stderr);
    va_end(args);
}

void Check(VkResult result, const char *call) {
    if (result != VK_SUCCESS) {
        Fatal("%s failed (%d)", call, static_cast<int>(result));
    }
}

namespace {

VkCommandPool g_oneshot_pool = VK_NULL_HANDLE;

VKAPI_ATTR VkBool32 VKAPI_CALL DebugCallback(VkDebugUtilsMessageSeverityFlagBitsEXT,
                                             VkDebugUtilsMessageTypeFlagsEXT             types,
                                             const VkDebugUtilsMessengerCallbackDataEXT *data, void *) {
    std::fprintf(stderr, "Vulkan validation: %s\n", data->pMessage);
    // General messages are the loader's (layer/driver version notes), not misuse of the API.
    if (types &
        (VK_DEBUG_UTILS_MESSAGE_TYPE_VALIDATION_BIT_EXT | VK_DEBUG_UTILS_MESSAGE_TYPE_PERFORMANCE_BIT_EXT)) {
        g.validation_messages++;
    }
    return VK_FALSE;
}

bool ValidationAvailable() {
    uint32_t count = 0;
    vkEnumerateInstanceLayerProperties(&count, nullptr);
    std::vector<VkLayerProperties> layers(count);
    vkEnumerateInstanceLayerProperties(&count, layers.data());
    return std::any_of(layers.begin(), layers.end(), [](const VkLayerProperties &layer) {
        return std::strcmp(layer.layerName, "VK_LAYER_KHRONOS_validation") == 0;
    });
}

void CreateInstance() {
    uint32_t loader_version = VK_API_VERSION_1_0;
    vkEnumerateInstanceVersion(&loader_version);
    if (loader_version < VK_API_VERSION_1_4) {
        Fatal("the Vulkan loader does not support Vulkan 1.4");
    }

    uint32_t           sdl_count = 0;
    const char *const *sdl_extensions = SDL_Vulkan_GetInstanceExtensions(&sdl_count);
    if (sdl_extensions == nullptr) {
        Fatal("SDL_Vulkan_GetInstanceExtensions: %s", SDL_GetError());
    }
    std::vector<const char *> extensions(sdl_extensions, sdl_extensions + sdl_count);
    std::vector<const char *> layers;

    bool wanted = g.config.validation || SDL_getenv("DC_VULKAN_VALIDATION") != nullptr;
    bool validation = wanted && ValidationAvailable();
    if (wanted && !validation) {
        Error("validation requested but VK_LAYER_KHRONOS_validation is not installed");
    }
    if (validation) {
        layers.push_back("VK_LAYER_KHRONOS_validation");
        extensions.push_back(VK_EXT_DEBUG_UTILS_EXTENSION_NAME);
    }

    VkApplicationInfo app = {};
    app.sType = VK_STRUCTURE_TYPE_APPLICATION_INFO;
    app.pApplicationName = "Dark Cloud";
    app.applicationVersion = VK_MAKE_VERSION(1, 0, 0);
    app.pEngineName = "dcdecomp";
    app.engineVersion = VK_MAKE_VERSION(1, 0, 0);
    app.apiVersion = VK_API_VERSION_1_4;

    VkDebugUtilsMessengerCreateInfoEXT messenger = {};
    messenger.sType = VK_STRUCTURE_TYPE_DEBUG_UTILS_MESSENGER_CREATE_INFO_EXT;
    messenger.messageSeverity =
        VK_DEBUG_UTILS_MESSAGE_SEVERITY_WARNING_BIT_EXT | VK_DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT;
    messenger.messageType = VK_DEBUG_UTILS_MESSAGE_TYPE_GENERAL_BIT_EXT |
                            VK_DEBUG_UTILS_MESSAGE_TYPE_VALIDATION_BIT_EXT |
                            VK_DEBUG_UTILS_MESSAGE_TYPE_PERFORMANCE_BIT_EXT;
    messenger.pfnUserCallback = DebugCallback;

    VkInstanceCreateInfo info = {};
    info.sType = VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO;
    info.pNext = validation ? &messenger : nullptr;
    info.pApplicationInfo = &app;
    info.enabledLayerCount = static_cast<uint32_t>(layers.size());
    info.ppEnabledLayerNames = layers.data();
    info.enabledExtensionCount = static_cast<uint32_t>(extensions.size());
    info.ppEnabledExtensionNames = extensions.data();
    Check(vkCreateInstance(&info, nullptr, &g.instance), "vkCreateInstance");

    if (validation) {
        auto create = reinterpret_cast<PFN_vkCreateDebugUtilsMessengerEXT>(
            vkGetInstanceProcAddr(g.instance, "vkCreateDebugUtilsMessengerEXT"));
        Check(create(g.instance, &messenger, nullptr, &g.messenger), "vkCreateDebugUtilsMessengerEXT");
    }
}

bool FindQueueFamily(VkPhysicalDevice device, uint32_t *family) {
    uint32_t count = 0;
    vkGetPhysicalDeviceQueueFamilyProperties(device, &count, nullptr);
    std::vector<VkQueueFamilyProperties> families(count);
    vkGetPhysicalDeviceQueueFamilyProperties(device, &count, families.data());
    for (uint32_t i = 0; i < count; i++) {
        VkBool32 present = VK_FALSE;
        vkGetPhysicalDeviceSurfaceSupportKHR(device, i, g.surface, &present);
        if ((families[i].queueFlags & VK_QUEUE_GRAPHICS_BIT) && present) {
            *family = i;
            return true;
        }
    }
    return false;
}

bool HasExtension(VkPhysicalDevice device, const char *name) {
    uint32_t count = 0;
    vkEnumerateDeviceExtensionProperties(device, nullptr, &count, nullptr);
    std::vector<VkExtensionProperties> extensions(count);
    vkEnumerateDeviceExtensionProperties(device, nullptr, &count, extensions.data());
    return std::any_of(extensions.begin(), extensions.end(), [name](const VkExtensionProperties &extension) {
        return std::strcmp(extension.extensionName, name) == 0;
    });
}

const char *MissingFeature(VkPhysicalDevice device) {
    VkPhysicalDeviceVulkan13Features features13 = {};
    features13.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_3_FEATURES;
    VkPhysicalDeviceVulkan12Features features12 = {};
    features12.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_2_FEATURES;
    features12.pNext = &features13;
    VkPhysicalDeviceFeatures2 features = {};
    features.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FEATURES_2;
    features.pNext = &features12;
    vkGetPhysicalDeviceFeatures2(device, &features);

    if (!features.features.dualSrcBlend) {
        return "dualSrcBlend";
    }
    if (!features.features.shaderClipDistance) {
        return "shaderClipDistance";
    }
    if (!features.features.shaderSampledImageArrayDynamicIndexing) {
        return "shaderSampledImageArrayDynamicIndexing";
    }
    VkPhysicalDeviceVulkan12Properties properties12 = {};
    properties12.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_2_PROPERTIES;
    VkPhysicalDeviceProperties2 properties = {};
    properties.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROPERTIES_2;
    properties.pNext = &properties12;
    vkGetPhysicalDeviceProperties2(device, &properties);
    if (properties12.maxPerStageDescriptorUpdateAfterBindSampledImages < kMaxTextures ||
        properties12.maxDescriptorSetUpdateAfterBindSampledImages < kMaxTextures) {
        return "room for the bindless texture array";
    }
    if (!features12.descriptorBindingPartiallyBound ||
        !features12.descriptorBindingSampledImageUpdateAfterBind ||
        !features12.descriptorBindingUpdateUnusedWhilePending) {
        return "descriptor indexing";
    }
    if (!features13.dynamicRendering || !features13.synchronization2) {
        return "dynamicRendering/synchronization2";
    }
    return nullptr;
}

void PickPhysicalDevice() {
    uint32_t count = 0;
    vkEnumeratePhysicalDevices(g.instance, &count, nullptr);
    std::vector<VkPhysicalDevice> devices(count);
    vkEnumeratePhysicalDevices(g.instance, &count, devices.data());

    int best = -1;
    for (VkPhysicalDevice device : devices) {
        VkPhysicalDeviceProperties properties;
        vkGetPhysicalDeviceProperties(device, &properties);
        uint32_t family;
        if (properties.apiVersion < VK_API_VERSION_1_4 ||
            !HasExtension(device, VK_KHR_SWAPCHAIN_EXTENSION_NAME) || !FindQueueFamily(device, &family)) {
            continue;
        }
        if (const char *missing = MissingFeature(device)) {
            Error("%s lacks %s", properties.deviceName, missing);
            continue;
        }
        int score = 0;
        if (properties.deviceType == VK_PHYSICAL_DEVICE_TYPE_DISCRETE_GPU) {
            score = 2;
        } else if (properties.deviceType == VK_PHYSICAL_DEVICE_TYPE_INTEGRATED_GPU) {
            score = 1;
        }
        if (score > best) {
            best = score;
            g.physical_device = device;
            g.queue_family = family;
        }
    }
    if (best < 0) {
        Fatal(
            "no GPU supports Vulkan 1.4 with the features the renderer needs and can present to the window");
    }

    vkGetPhysicalDeviceProperties(g.physical_device, &g.properties);
    vkGetPhysicalDeviceMemoryProperties(g.physical_device, &g.memory_properties);
    std::fprintf(stderr, "Vulkan: using %s (Vulkan %u.%u.%u)\n", g.properties.deviceName,
                 VK_API_VERSION_MAJOR(g.properties.apiVersion), VK_API_VERSION_MINOR(g.properties.apiVersion),
                 VK_API_VERSION_PATCH(g.properties.apiVersion));
}

bool DepthStencilUsable(VkFormat format) {
    VkFormatProperties properties;
    vkGetPhysicalDeviceFormatProperties(g.physical_device, format, &properties);
    VkFormatFeatureFlags needed = VK_FORMAT_FEATURE_DEPTH_STENCIL_ATTACHMENT_BIT |
                                  VK_FORMAT_FEATURE_TRANSFER_SRC_BIT | VK_FORMAT_FEATURE_TRANSFER_DST_BIT;
    return (properties.optimalTilingFeatures & needed) == needed;
}

VkFormat PickDepthFormat() {
    for (VkFormat format : {VK_FORMAT_D32_SFLOAT_S8_UINT, VK_FORMAT_D24_UNORM_S8_UINT}) {
        if (DepthStencilUsable(format)) {
            return format;
        }
    }
    Fatal("%s has no depth/stencil format the renderer can use", g.properties.deviceName);
}

bool SupportsDynamicColorWriteMask() {
    if (!HasExtension(g.physical_device, VK_EXT_EXTENDED_DYNAMIC_STATE_3_EXTENSION_NAME)) {
        return false;
    }
    VkPhysicalDeviceExtendedDynamicState3FeaturesEXT dynamic3 = {};
    dynamic3.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_3_FEATURES_EXT;
    VkPhysicalDeviceFeatures2 features = {};
    features.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FEATURES_2;
    features.pNext = &dynamic3;
    vkGetPhysicalDeviceFeatures2(g.physical_device, &features);
    return dynamic3.extendedDynamicState3ColorWriteMask == VK_TRUE;
}

void CreateDevice() {
    g.depth_format = PickDepthFormat();
    g.dynamic_color_write_mask = g.config.dynamic_color_write_mask && SupportsDynamicColorWriteMask();

    float                   priority = 1.0f;
    VkDeviceQueueCreateInfo queue = {};
    queue.sType = VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO;
    queue.queueFamilyIndex = g.queue_family;
    queue.queueCount = 1;
    queue.pQueuePriorities = &priority;

    VkPhysicalDeviceExtendedDynamicState3FeaturesEXT dynamic3 = {};
    dynamic3.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_3_FEATURES_EXT;
    dynamic3.extendedDynamicState3ColorWriteMask = VK_TRUE;

    VkPhysicalDeviceVulkan13Features features13 = {};
    features13.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_3_FEATURES;
    features13.pNext = g.dynamic_color_write_mask ? &dynamic3 : nullptr;
    features13.dynamicRendering = VK_TRUE;
    features13.synchronization2 = VK_TRUE;

    VkPhysicalDeviceVulkan12Features features12 = {};
    features12.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_2_FEATURES;
    features12.pNext = &features13;
    features12.descriptorBindingPartiallyBound = VK_TRUE;
    features12.descriptorBindingSampledImageUpdateAfterBind = VK_TRUE;
    features12.descriptorBindingUpdateUnusedWhilePending = VK_TRUE;

    VkPhysicalDeviceFeatures2 features = {};
    features.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FEATURES_2;
    features.pNext = &features12;
    features.features.dualSrcBlend = VK_TRUE;
    features.features.shaderClipDistance = VK_TRUE;
    features.features.shaderSampledImageArrayDynamicIndexing = VK_TRUE;

    const char *extensions[] = {VK_KHR_SWAPCHAIN_EXTENSION_NAME, VK_EXT_EXTENDED_DYNAMIC_STATE_3_EXTENSION_NAME};

    VkDeviceCreateInfo info = {};
    info.sType = VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO;
    info.pNext = &features;
    info.queueCreateInfoCount = 1;
    info.pQueueCreateInfos = &queue;
    info.enabledExtensionCount = g.dynamic_color_write_mask ? 2 : 1;
    info.ppEnabledExtensionNames = extensions;
    Check(vkCreateDevice(g.physical_device, &info, nullptr, &g.device), "vkCreateDevice");
    vkGetDeviceQueue(g.device, g.queue_family, 0, &g.queue);
    if (g.dynamic_color_write_mask) {
        g.cmd_set_color_write_mask = reinterpret_cast<PFN_vkCmdSetColorWriteMaskEXT>(
            vkGetDeviceProcAddr(g.device, "vkCmdSetColorWriteMaskEXT"));
        g.dynamic_color_write_mask = g.cmd_set_color_write_mask != nullptr;
    }
}

VkSurfaceFormatKHR PickSurfaceFormat() {
    uint32_t count = 0;
    vkGetPhysicalDeviceSurfaceFormatsKHR(g.physical_device, g.surface, &count, nullptr);
    std::vector<VkSurfaceFormatKHR> formats(count);
    vkGetPhysicalDeviceSurfaceFormatsKHR(g.physical_device, g.surface, &count, formats.data());
    for (const VkSurfaceFormatKHR &format : formats) {
        if ((format.format == VK_FORMAT_B8G8R8A8_UNORM || format.format == VK_FORMAT_R8G8B8A8_UNORM) &&
            format.colorSpace == VK_COLOR_SPACE_SRGB_NONLINEAR_KHR) {
            return format;
        }
    }
    return formats[0];
}

VkPresentModeKHR PickPresentMode() {
    if (g.config.present_mode == PresentMode::Mailbox) {
        uint32_t count = 0;
        vkGetPhysicalDeviceSurfacePresentModesKHR(g.physical_device, g.surface, &count, nullptr);
        std::vector<VkPresentModeKHR> modes(count);
        vkGetPhysicalDeviceSurfacePresentModesKHR(g.physical_device, g.surface, &count, modes.data());
        if (std::find(modes.begin(), modes.end(), VK_PRESENT_MODE_MAILBOX_KHR) != modes.end()) {
            return VK_PRESENT_MODE_MAILBOX_KHR;
        }
    }
    return VK_PRESENT_MODE_FIFO_KHR;
}

void DestroySwapchainResources() {
    for (VkSemaphore semaphore : g.swapchain.render_finished) {
        vkDestroySemaphore(g.device, semaphore, nullptr);
    }
    g.swapchain.render_finished.clear();
    g.swapchain.images.clear();
}

bool CreateSwapchain() {
    VkSurfaceCapabilitiesKHR capabilities;
    Check(vkGetPhysicalDeviceSurfaceCapabilitiesKHR(g.physical_device, g.surface, &capabilities),
          "vkGetPhysicalDeviceSurfaceCapabilitiesKHR");
    if (!(capabilities.supportedUsageFlags & VK_IMAGE_USAGE_TRANSFER_DST_BIT)) {
        Fatal("the surface cannot be a transfer destination");
    }

    VkExtent2D extent = capabilities.currentExtent;
    if (extent.width == UINT32_MAX) {
        int width = 0;
        int height = 0;
        SDL_GetWindowSizeInPixels(g.window, &width, &height);
        extent.width = std::clamp(static_cast<uint32_t>(std::max(width, 0)),
                                  capabilities.minImageExtent.width, capabilities.maxImageExtent.width);
        extent.height = std::clamp(static_cast<uint32_t>(std::max(height, 0)),
                                   capabilities.minImageExtent.height, capabilities.maxImageExtent.height);
    }
    if (extent.width == 0 || extent.height == 0) {
        return false;
    }

    uint32_t image_count = capabilities.minImageCount + 1;
    if (capabilities.maxImageCount != 0) {
        image_count = std::min(image_count, capabilities.maxImageCount);
    }

    VkSurfaceFormatKHR format = PickSurfaceFormat();
    VkSwapchainKHR     old = g.swapchain.handle;

    VkSwapchainCreateInfoKHR info = {};
    info.sType = VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR;
    info.surface = g.surface;
    info.minImageCount = image_count;
    info.imageFormat = format.format;
    info.imageColorSpace = format.colorSpace;
    info.imageExtent = extent;
    info.imageArrayLayers = 1;
    info.imageUsage = VK_IMAGE_USAGE_TRANSFER_DST_BIT;
    info.imageSharingMode = VK_SHARING_MODE_EXCLUSIVE;
    info.preTransform = capabilities.currentTransform;
    info.compositeAlpha = VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR;
    info.presentMode = PickPresentMode();
    info.clipped = VK_TRUE;
    info.oldSwapchain = old;
    Check(vkCreateSwapchainKHR(g.device, &info, nullptr, &g.swapchain.handle), "vkCreateSwapchainKHR");
    if (old != VK_NULL_HANDLE) {
        vkDestroySwapchainKHR(g.device, old, nullptr);
    }

    g.swapchain.format = format.format;
    g.swapchain.extent = extent;
    uint32_t count = 0;
    vkGetSwapchainImagesKHR(g.device, g.swapchain.handle, &count, nullptr);
    g.swapchain.images.resize(count);
    vkGetSwapchainImagesKHR(g.device, g.swapchain.handle, &count, g.swapchain.images.data());
    g.swapchain.render_finished.resize(count);
    for (uint32_t i = 0; i < count; i++) {
        VkSemaphoreCreateInfo semaphore = {};
        semaphore.sType = VK_STRUCTURE_TYPE_SEMAPHORE_CREATE_INFO;
        Check(vkCreateSemaphore(g.device, &semaphore, nullptr, &g.swapchain.render_finished[i]),
              "vkCreateSemaphore");
    }
    return true;
}

bool RecreateSwapchain() {
    vkDeviceWaitIdle(g.device);
    DestroySwapchainResources();
    if (!CreateSwapchain()) {
        return false;
    }
    g.resize_pending = false;
    const Image &main = g.main_color[0];
    if (main.width != g.swapchain.extent.width || main.height != g.swapchain.extent.height) {
        DestroyMainTargets();
        CreateMainTargets();
        RecreateSharedTargets();
    }
    return true;
}

void CreateFrames() {
    for (Frame &frame : g.frames) {
        VkCommandPoolCreateInfo pool = {};
        pool.sType = VK_STRUCTURE_TYPE_COMMAND_POOL_CREATE_INFO;
        pool.flags = VK_COMMAND_POOL_CREATE_TRANSIENT_BIT;
        pool.queueFamilyIndex = g.queue_family;
        Check(vkCreateCommandPool(g.device, &pool, nullptr, &frame.pool), "vkCreateCommandPool");

        VkCommandBuffer             buffers[2];
        VkCommandBufferAllocateInfo allocate = {};
        allocate.sType = VK_STRUCTURE_TYPE_COMMAND_BUFFER_ALLOCATE_INFO;
        allocate.commandPool = frame.pool;
        allocate.level = VK_COMMAND_BUFFER_LEVEL_PRIMARY;
        allocate.commandBufferCount = 2;
        Check(vkAllocateCommandBuffers(g.device, &allocate, buffers), "vkAllocateCommandBuffers");
        frame.upload_cmd = buffers[0];
        frame.draw_cmd = buffers[1];

        VkSemaphoreCreateInfo semaphore = {};
        semaphore.sType = VK_STRUCTURE_TYPE_SEMAPHORE_CREATE_INFO;
        Check(vkCreateSemaphore(g.device, &semaphore, nullptr, &frame.image_available), "vkCreateSemaphore");

        VkFenceCreateInfo fence = {};
        fence.sType = VK_STRUCTURE_TYPE_FENCE_CREATE_INFO;
        Check(vkCreateFence(g.device, &fence, nullptr, &frame.fence), "vkCreateFence");
    }

    VkCommandPoolCreateInfo pool = {};
    pool.sType = VK_STRUCTURE_TYPE_COMMAND_POOL_CREATE_INFO;
    pool.flags = VK_COMMAND_POOL_CREATE_TRANSIENT_BIT;
    pool.queueFamilyIndex = g.queue_family;
    Check(vkCreateCommandPool(g.device, &pool, nullptr, &g_oneshot_pool), "vkCreateCommandPool");
}

void RunDeletions(Frame &frame) {
    std::vector<std::function<void()>> deletions;
    deletions.swap(frame.deletions);
    for (std::function<void()> &deletion : deletions) {
        deletion();
    }
}

void WaitFrame(Frame &frame) {
    if (frame.pending) {
        Check(vkWaitForFences(g.device, 1, &frame.fence, VK_TRUE, UINT64_MAX), "vkWaitForFences");
        frame.pending = false;
    }
}

// Moves recording to the next slot once the GPU is done with what that slot last submitted.
void AdvanceSlot() {
    g.frame_slot = (g.frame_slot + 1) % kFramesInFlight;
    Frame &frame = CurrentFrame();
    WaitFrame(frame);
    RunDeletions(frame);
    ResetTransients(frame);
    Check(vkResetCommandPool(g.device, frame.pool, 0), "vkResetCommandPool");
    frame.upload_open = false;
}

void Submit(bool with_draw, VkSemaphore wait, VkSemaphore signal) {
    Frame                                 &frame = CurrentFrame();
    std::vector<VkCommandBufferSubmitInfo> commands;
    if (frame.upload_open) {
        Check(vkEndCommandBuffer(frame.upload_cmd), "vkEndCommandBuffer");
        frame.upload_open = false;
        commands.push_back({VK_STRUCTURE_TYPE_COMMAND_BUFFER_SUBMIT_INFO, nullptr, frame.upload_cmd, 0});
    }
    if (with_draw) {
        commands.push_back({VK_STRUCTURE_TYPE_COMMAND_BUFFER_SUBMIT_INFO, nullptr, frame.draw_cmd, 0});
    }

    VkSemaphoreSubmitInfo wait_info = {};
    wait_info.sType = VK_STRUCTURE_TYPE_SEMAPHORE_SUBMIT_INFO;
    wait_info.semaphore = wait;
    wait_info.stageMask = VK_PIPELINE_STAGE_2_ALL_TRANSFER_BIT;
    VkSemaphoreSubmitInfo signal_info = {};
    signal_info.sType = VK_STRUCTURE_TYPE_SEMAPHORE_SUBMIT_INFO;
    signal_info.semaphore = signal;
    signal_info.stageMask = VK_PIPELINE_STAGE_2_ALL_COMMANDS_BIT;

    VkSubmitInfo2 submit = {};
    submit.sType = VK_STRUCTURE_TYPE_SUBMIT_INFO_2;
    submit.waitSemaphoreInfoCount = wait != VK_NULL_HANDLE ? 1 : 0;
    submit.pWaitSemaphoreInfos = &wait_info;
    submit.commandBufferInfoCount = static_cast<uint32_t>(commands.size());
    submit.pCommandBufferInfos = commands.data();
    submit.signalSemaphoreInfoCount = signal != VK_NULL_HANDLE ? 1 : 0;
    submit.pSignalSemaphoreInfos = &signal_info;
    Check(vkResetFences(g.device, 1, &frame.fence), "vkResetFences");
    Check(vkQueueSubmit2(g.queue, 1, &submit, frame.fence), "vkQueueSubmit2");
    frame.pending = true;
}

void BeginCommands(VkCommandBuffer cmd) {
    VkCommandBufferBeginInfo begin = {};
    begin.sType = VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO;
    begin.flags = VK_COMMAND_BUFFER_USAGE_ONE_TIME_SUBMIT_BIT;
    Check(vkBeginCommandBuffer(cmd, &begin), "vkBeginCommandBuffer");
}

void SwapchainBarrier(VkCommandBuffer cmd, VkImage image, VkImageLayout from, VkImageLayout to,
                      VkPipelineStageFlags2 src_stage, VkAccessFlags2 src_access,
                      VkPipelineStageFlags2 dst_stage, VkAccessFlags2 dst_access) {
    VkImageMemoryBarrier2 barrier = {};
    barrier.sType = VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER_2;
    barrier.srcStageMask = src_stage;
    barrier.srcAccessMask = src_access;
    barrier.dstStageMask = dst_stage;
    barrier.dstAccessMask = dst_access;
    barrier.oldLayout = from;
    barrier.newLayout = to;
    barrier.srcQueueFamilyIndex = VK_QUEUE_FAMILY_IGNORED;
    barrier.dstQueueFamilyIndex = VK_QUEUE_FAMILY_IGNORED;
    barrier.image = image;
    barrier.subresourceRange.aspectMask = VK_IMAGE_ASPECT_COLOR_BIT;
    barrier.subresourceRange.levelCount = 1;
    barrier.subresourceRange.layerCount = 1;
    VkDependencyInfo dependency = {};
    dependency.sType = VK_STRUCTURE_TYPE_DEPENDENCY_INFO;
    dependency.imageMemoryBarrierCount = 1;
    dependency.pImageMemoryBarriers = &barrier;
    vkCmdPipelineBarrier2(cmd, &dependency);
}

} // namespace

Frame &CurrentFrame() { return g.frames[g.frame_slot]; }

VkCommandBuffer UploadCommands() {
    Frame &frame = CurrentFrame();
    if (!frame.upload_open) {
        BeginCommands(frame.upload_cmd);
        frame.upload_open = true;
    }
    return frame.upload_cmd;
}

VkCommandBuffer DrawCommands() { return CurrentFrame().draw_cmd; }

void DeferDestroy(std::function<void()> destroy) { CurrentFrame().deletions.push_back(std::move(destroy)); }

void SubmitUploadsAndWait() {
    if (g.in_frame || !CurrentFrame().upload_open) {
        return;
    }
    Submit(false, VK_NULL_HANDLE, VK_NULL_HANDLE);
    WaitFrame(CurrentFrame());
    AdvanceSlot();
}

void RunOneShot(const std::function<void(VkCommandBuffer)> &record) {
    SubmitUploadsAndWait();

    VkCommandBuffer             cmd;
    VkCommandBufferAllocateInfo allocate = {};
    allocate.sType = VK_STRUCTURE_TYPE_COMMAND_BUFFER_ALLOCATE_INFO;
    allocate.commandPool = g_oneshot_pool;
    allocate.level = VK_COMMAND_BUFFER_LEVEL_PRIMARY;
    allocate.commandBufferCount = 1;
    Check(vkAllocateCommandBuffers(g.device, &allocate, &cmd), "vkAllocateCommandBuffers");
    BeginCommands(cmd);
    record(cmd);
    Check(vkEndCommandBuffer(cmd), "vkEndCommandBuffer");

    VkFence           fence;
    VkFenceCreateInfo fence_info = {};
    fence_info.sType = VK_STRUCTURE_TYPE_FENCE_CREATE_INFO;
    Check(vkCreateFence(g.device, &fence_info, nullptr, &fence), "vkCreateFence");
    VkCommandBufferSubmitInfo command = {VK_STRUCTURE_TYPE_COMMAND_BUFFER_SUBMIT_INFO, nullptr, cmd, 0};
    VkSubmitInfo2             submit = {};
    submit.sType = VK_STRUCTURE_TYPE_SUBMIT_INFO_2;
    submit.commandBufferInfoCount = 1;
    submit.pCommandBufferInfos = &command;
    Check(vkQueueSubmit2(g.queue, 1, &submit, fence), "vkQueueSubmit2");
    Check(vkWaitForFences(g.device, 1, &fence, VK_TRUE, UINT64_MAX), "vkWaitForFences");
    vkDestroyFence(g.device, fence, nullptr);
    vkFreeCommandBuffers(g.device, g_oneshot_pool, 1, &cmd);
}

Image &CurrentMainColor() { return g.main_color[g.main_current]; }

Image &PreviousMainColor() { return g.main_color[g.main_current ^ 1]; }

void CreateMainTargets() {
    uint32_t width = g.swapchain.extent.width;
    uint32_t height = g.swapchain.extent.height;
    for (Image &image : g.main_color) {
        image = CreateImage(width, height, 1, kColorFormat,
                            VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT | VK_IMAGE_USAGE_SAMPLED_BIT |
                                VK_IMAGE_USAGE_TRANSFER_SRC_BIT | VK_IMAGE_USAGE_TRANSFER_DST_BIT);
    }
    g.main_depth = CreateImage(width, height, 1, g.depth_format,
                               VK_IMAGE_USAGE_DEPTH_STENCIL_ATTACHMENT_BIT | VK_IMAGE_USAGE_TRANSFER_SRC_BIT |
                                   VK_IMAGE_USAGE_TRANSFER_DST_BIT);

    RunOneShot([](VkCommandBuffer cmd) {
        VkImageSubresourceRange range = {VK_IMAGE_ASPECT_COLOR_BIT, 0, 1, 0, 1};
        VkClearColorValue       black = {
            {0.0f, 0.0f, 0.0f, 1.0f}
        };
        for (Image &image : g.main_color) {
            Transition(cmd, image, TransferDst());
            vkCmdClearColorImage(cmd, image.image, VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL, &black, 1, &range);
            ToRest(cmd, image);
        }
        VkImageSubresourceRange  depth_range = {g.main_depth.aspect, 0, 1, 0, 1};
        VkClearDepthStencilValue far = {0.0f, 0};
        Transition(cmd, g.main_depth, TransferDst());
        vkCmdClearDepthStencilImage(cmd, g.main_depth.image, VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL, &far, 1,
                                    &depth_range);
        ToRest(cmd, g.main_depth);
    });

    VkDescriptorImageInfo images[2];
    for (uint32_t i = 0; i < 2; i++) {
        images[i] = {VK_NULL_HANDLE, g.main_color[i].view, VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL};
    }
    VkWriteDescriptorSet write = {};
    write.sType = VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET;
    write.dstSet = g.texture_set;
    write.dstBinding = 0;
    write.dstArrayElement = kMainTarget;
    write.descriptorCount = 2;
    write.descriptorType = VK_DESCRIPTOR_TYPE_SAMPLED_IMAGE;
    write.pImageInfo = images;
    vkUpdateDescriptorSets(g.device, 1, &write, 0, nullptr);
}

void DestroyMainTargets() {
    for (Image &image : g.main_color) {
        DestroyImage(image);
    }
    DestroyImage(g.main_depth);
}

} // namespace detail

using namespace detail;

void RendererInit(SDL_Window *window, const RendererConfig &config) {
    g = {};
    g.window = window;
    g.config = config;
    CreateInstance();
    if (!SDL_Vulkan_CreateSurface(window, g.instance, nullptr, &g.surface)) {
        Fatal("SDL_Vulkan_CreateSurface: %s", SDL_GetError());
    }
    PickPhysicalDevice();
    CreateDevice();
    CreateFrames();
    CreatePipelineLayout();
    InitResources();
    if (!CreateSwapchain()) {
        // A window that starts minimised still needs main targets for render-to-texture work.
        int width = 0;
        int height = 0;
        SDL_GetWindowSizeInPixels(window, &width, &height);
        g.swapchain.extent = {static_cast<uint32_t>(std::max(width, 1)),
                              static_cast<uint32_t>(std::max(height, 1))};
        g.resize_pending = true;
    }
    CreateMainTargets();
    g.render_scale =
        config.render_scale > 0.0f
            ? config.render_scale
            : std::max(1.0f, std::round(static_cast<float>(g.swapchain.extent.height) / kLogicalHeight));
    CreatePipelines();
}

void RendererShutdown() {
    if (g.device == VK_NULL_HANDLE) {
        return;
    }
    vkDeviceWaitIdle(g.device);
    for (Frame &frame : g.frames) {
        RunDeletions(frame);
    }
    DestroyPipelines();
    ShutdownResources();
    for (Frame &frame : g.frames) {
        DestroyTransients(frame);
        DestroyBuffer(frame.depth_readback);
        vkDestroyFence(g.device, frame.fence, nullptr);
        vkDestroySemaphore(g.device, frame.image_available, nullptr);
        vkDestroyCommandPool(g.device, frame.pool, nullptr);
    }
    vkDestroyCommandPool(g.device, g_oneshot_pool, nullptr);
    g_oneshot_pool = VK_NULL_HANDLE;
    DestroyMainTargets();
    DestroySwapchainResources();
    if (g.swapchain.handle != VK_NULL_HANDLE) {
        vkDestroySwapchainKHR(g.device, g.swapchain.handle, nullptr);
    }
    vkDestroyDescriptorPool(g.device, g.texture_pool, nullptr);
    vkDestroyDescriptorPool(g.device, g.constants_pool, nullptr);
    vkDestroyDescriptorSetLayout(g.device, g.texture_set_layout, nullptr);
    vkDestroyDescriptorSetLayout(g.device, g.constants_set_layout, nullptr);
    vkDestroyPipelineLayout(g.device, g.pipeline_layout, nullptr);
    for (VkSampler sampler : g.samplers) {
        vkDestroySampler(g.device, sampler, nullptr);
    }
    ShutdownMemory();
    vkDestroyDevice(g.device, nullptr);
    SDL_Vulkan_DestroySurface(g.instance, g.surface, nullptr);
    if (g.messenger != VK_NULL_HANDLE) {
        auto destroy = reinterpret_cast<PFN_vkDestroyDebugUtilsMessengerEXT>(
            vkGetInstanceProcAddr(g.instance, "vkDestroyDebugUtilsMessengerEXT"));
        destroy(g.instance, g.messenger, nullptr);
    }
    vkDestroyInstance(g.instance, nullptr);
    uint32_t messages = g.validation_messages;
    g = {};
    g.validation_messages = messages;
}

void RendererResize() { g.resize_pending = true; }

bool BeginFrame() {
    if (g.in_frame) {
        Error("BeginFrame inside a frame");
        return true;
    }
    if ((g.resize_pending || g.swapchain.handle == VK_NULL_HANDLE) && !RecreateSwapchain()) {
        SubmitUploadsAndWait();
        return false;
    }

    VkResult result = vkAcquireNextImageKHR(g.device, g.swapchain.handle, UINT64_MAX,
                                            CurrentFrame().image_available, VK_NULL_HANDLE, &g.image_index);
    if (result == VK_ERROR_OUT_OF_DATE_KHR) {
        // Recreating may submit pending uploads and move to the next slot.
        if (!RecreateSwapchain()) {
            SubmitUploadsAndWait();
            return false;
        }
        result = vkAcquireNextImageKHR(g.device, g.swapchain.handle, UINT64_MAX,
                                       CurrentFrame().image_available, VK_NULL_HANDLE, &g.image_index);
    }
    if (result == VK_SUBOPTIMAL_KHR) {
        g.resize_pending = true;
    } else if (result != VK_SUCCESS) {
        Error("vkAcquireNextImageKHR failed (%d)", static_cast<int>(result));
        SubmitUploadsAndWait();
        return false;
    }

    BeginCommands(CurrentFrame().draw_cmd);
    g.in_frame = true;
    g.frame_serial++;
    g.target = kMainTarget;
    g.rendering = false;
    ResetDrawState();
    return true;
}

void EndFrame() {
    if (!g.in_frame) {
        return;
    }
    Frame          &frame = CurrentFrame();
    VkCommandBuffer cmd = frame.draw_cmd;
    EndRendering();
    ReleaseTarget();
    RecordDepthQueries(cmd);

    Image  &main = CurrentMainColor();
    VkImage swapchain = g.swapchain.images[g.image_index];
    Transition(cmd, main, TransferSrc());
    // Chained to the acquire semaphore, which the submit waits on at the transfer stage.
    SwapchainBarrier(cmd, swapchain, VK_IMAGE_LAYOUT_UNDEFINED, VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL,
                     VK_PIPELINE_STAGE_2_ALL_TRANSFER_BIT, VK_ACCESS_2_NONE,
                     VK_PIPELINE_STAGE_2_ALL_TRANSFER_BIT, VK_ACCESS_2_TRANSFER_WRITE_BIT);
    VkImageBlit region = {};
    region.srcSubresource = {VK_IMAGE_ASPECT_COLOR_BIT, 0, 0, 1};
    region.srcOffsets[1] = {static_cast<int32_t>(main.width), static_cast<int32_t>(main.height), 1};
    region.dstSubresource = {VK_IMAGE_ASPECT_COLOR_BIT, 0, 0, 1};
    region.dstOffsets[1] = {static_cast<int32_t>(g.swapchain.extent.width),
                            static_cast<int32_t>(g.swapchain.extent.height), 1};
    vkCmdBlitImage(cmd, main.image, VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL, swapchain,
                   VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL, 1, &region, VK_FILTER_NEAREST);
    SwapchainBarrier(cmd, swapchain, VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL, VK_IMAGE_LAYOUT_PRESENT_SRC_KHR,
                     VK_PIPELINE_STAGE_2_ALL_TRANSFER_BIT, VK_ACCESS_2_TRANSFER_WRITE_BIT,
                     VK_PIPELINE_STAGE_2_ALL_COMMANDS_BIT, VK_ACCESS_2_NONE);
    ToRest(cmd, main);
    Check(vkEndCommandBuffer(cmd), "vkEndCommandBuffer");

    VkSemaphore render_finished = g.swapchain.render_finished[g.image_index];
    Submit(true, frame.image_available, render_finished);
    g.in_frame = false;

    VkPresentInfoKHR present = {};
    present.sType = VK_STRUCTURE_TYPE_PRESENT_INFO_KHR;
    present.waitSemaphoreCount = 1;
    present.pWaitSemaphores = &render_finished;
    present.swapchainCount = 1;
    present.pSwapchains = &g.swapchain.handle;
    present.pImageIndices = &g.image_index;
    VkResult result = vkQueuePresentKHR(g.queue, &present);
    if (result == VK_ERROR_OUT_OF_DATE_KHR || result == VK_SUBOPTIMAL_KHR) {
        g.resize_pending = true;
    } else {
        Check(result, "vkQueuePresentKHR");
    }

    if (g.depth_queries_recorded) {
        WaitFrame(frame);
        HarvestDepthQueries();
    }
    g.main_current ^= 1;
    AdvanceSlot();
}

bool InFrame() { return g.in_frame; }

uint32_t ValidationMessageCount() { return g.validation_messages; }

float RenderScale() { return g.render_scale; }

void SetRenderScale(float scale) {
    if (scale <= 0.0f || scale == g.render_scale || g.in_frame) {
        return;
    }
    g.render_scale = scale;
    RecreateRenderTargets();
}

} // namespace gfx
