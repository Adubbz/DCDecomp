#include "renderer.hpp"

#include <SDL3/SDL.h>
#include <SDL3/SDL_vulkan.h>
#include <vulkan/vulkan.h>

#include <algorithm>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <vector>

namespace {

constexpr int kFramesInFlight = 2;

struct Frame {
    VkCommandPool   command_pool;    /**< Pool the frame's command buffer is allocated from. */
    VkCommandBuffer command_buffer;  /**< Records the frame. */
    VkSemaphore     image_available; /**< Signalled when the acquired swapchain image is ready. */
    VkFence         in_flight;       /**< Signalled when the GPU has finished the frame. */
};

struct Swapchain {
    VkSwapchainKHR           handle;          /**< The swapchain. */
    VkFormat                 format;          /**< The format of the images. */
    VkExtent2D               extent;          /**< Image size in pixels. */
    std::vector<VkImage>     images;          /**< Swapchain images. */
    std::vector<VkImageView> views;           /**< A colour view of each image. */
    std::vector<VkSemaphore> render_finished; /**< Signalled when rendering to each image is done, for presentation to wait on. */
};

struct Renderer {
    SDL_Window              *window;                  /**< The window presented to. */
    VkInstance               instance;                /**< The Vulkan instance. */
    VkDebugUtilsMessengerEXT messenger;               /**< Reports validation messages, when validation is on. */
    VkSurfaceKHR             surface;                 /**< The window's surface. */
    VkPhysicalDevice         physical_device;         /**< The GPU in use. */
    VkDevice                 device;                  /**< The logical device. */
    uint32_t                 queue_family;            /**< Family of the queue that draws and presents. */
    VkQueue                  queue;                   /**< The queue that draws and presents. */
    Swapchain                swapchain;               /**< The current swapchain. */
    Frame                    frames[kFramesInFlight]; /**< The frames in flight. */
    int                      frame_index;             /**< Which of frames is being recorded. */
    uint32_t                 image_index;             /**< The swapchain image the current frame draws to. */
    bool                     resized;                 /**< The swapchain must be rebuilt before the next frame. */
    VkClearColorValue        clear_color;             /**< The colour each frame is cleared to. */
};

Renderer g_renderer;

[[noreturn]] void Fatal(const char *what) {
    std::fprintf(stderr, "Vulkan: %s\n", what);
    std::exit(1);
}

void Check(VkResult result, const char *call) {
    if (result != VK_SUCCESS) {
        std::fprintf(stderr, "Vulkan: %s failed (%d)\n", call, static_cast<int>(result));
        std::exit(1);
    }
}

VKAPI_ATTR VkBool32 VKAPI_CALL DebugCallback(VkDebugUtilsMessageSeverityFlagBitsEXT severity, VkDebugUtilsMessageTypeFlagsEXT types,
                                             const VkDebugUtilsMessengerCallbackDataEXT *data, void *user_data) {
    std::fprintf(stderr, "Vulkan validation: %s\n", data->pMessage);
    return VK_FALSE;
}

bool ValidationWanted() {
#ifndef NDEBUG
    return true;
#else
    return SDL_getenv("DC_VULKAN_VALIDATION") != nullptr;
#endif
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

    uint32_t           sdl_extension_count = 0;
    const char *const *sdl_extensions = SDL_Vulkan_GetInstanceExtensions(&sdl_extension_count);
    if (sdl_extensions == nullptr) {
        std::fprintf(stderr, "SDL_Vulkan_GetInstanceExtensions: %s\n", SDL_GetError());
        std::exit(1);
    }
    std::vector<const char *> extensions(sdl_extensions, sdl_extensions + sdl_extension_count);
    std::vector<const char *> layers;

    bool validation = ValidationWanted() && ValidationAvailable();
    if (validation) {
        layers.push_back("VK_LAYER_KHRONOS_validation");
        extensions.push_back(VK_EXT_DEBUG_UTILS_EXTENSION_NAME);
    }

    VkApplicationInfo app_info = {};
    app_info.sType = VK_STRUCTURE_TYPE_APPLICATION_INFO;
    app_info.pApplicationName = "Dark Cloud";
    app_info.applicationVersion = VK_MAKE_VERSION(1, 0, 0);
    app_info.pEngineName = "dcdecomp";
    app_info.engineVersion = VK_MAKE_VERSION(1, 0, 0);
    app_info.apiVersion = VK_API_VERSION_1_4;

    VkDebugUtilsMessengerCreateInfoEXT messenger_info = {};
    messenger_info.sType = VK_STRUCTURE_TYPE_DEBUG_UTILS_MESSENGER_CREATE_INFO_EXT;
    messenger_info.messageSeverity = VK_DEBUG_UTILS_MESSAGE_SEVERITY_WARNING_BIT_EXT | VK_DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT;
    messenger_info.messageType = VK_DEBUG_UTILS_MESSAGE_TYPE_GENERAL_BIT_EXT | VK_DEBUG_UTILS_MESSAGE_TYPE_VALIDATION_BIT_EXT |
                                 VK_DEBUG_UTILS_MESSAGE_TYPE_PERFORMANCE_BIT_EXT;
    messenger_info.pfnUserCallback = DebugCallback;

    VkInstanceCreateInfo create_info = {};
    create_info.sType = VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO;
    create_info.pNext = validation ? &messenger_info : nullptr;
    create_info.pApplicationInfo = &app_info;
    create_info.enabledLayerCount = static_cast<uint32_t>(layers.size());
    create_info.ppEnabledLayerNames = layers.data();
    create_info.enabledExtensionCount = static_cast<uint32_t>(extensions.size());
    create_info.ppEnabledExtensionNames = extensions.data();
    Check(vkCreateInstance(&create_info, nullptr, &g_renderer.instance), "vkCreateInstance");

    if (validation) {
        auto create_messenger = reinterpret_cast<PFN_vkCreateDebugUtilsMessengerEXT>(
            vkGetInstanceProcAddr(g_renderer.instance, "vkCreateDebugUtilsMessengerEXT"));
        Check(create_messenger(g_renderer.instance, &messenger_info, nullptr, &g_renderer.messenger), "vkCreateDebugUtilsMessengerEXT");
    }
}

void CreateSurface() {
    if (!SDL_Vulkan_CreateSurface(g_renderer.window, g_renderer.instance, nullptr, &g_renderer.surface)) {
        std::fprintf(stderr, "SDL_Vulkan_CreateSurface: %s\n", SDL_GetError());
        std::exit(1);
    }
}

bool FindQueueFamily(VkPhysicalDevice device, uint32_t *family) {
    uint32_t count = 0;
    vkGetPhysicalDeviceQueueFamilyProperties(device, &count, nullptr);
    std::vector<VkQueueFamilyProperties> families(count);
    vkGetPhysicalDeviceQueueFamilyProperties(device, &count, families.data());

    for (uint32_t i = 0; i < count; i++) {
        VkBool32 present = VK_FALSE;
        vkGetPhysicalDeviceSurfaceSupportKHR(device, i, g_renderer.surface, &present);
        if ((families[i].queueFlags & VK_QUEUE_GRAPHICS_BIT) && present) {
            *family = i;
            return true;
        }
    }
    return false;
}

bool HasSwapchain(VkPhysicalDevice device) {
    uint32_t count = 0;
    vkEnumerateDeviceExtensionProperties(device, nullptr, &count, nullptr);
    std::vector<VkExtensionProperties> extensions(count);
    vkEnumerateDeviceExtensionProperties(device, nullptr, &count, extensions.data());
    return std::any_of(extensions.begin(), extensions.end(), [](const VkExtensionProperties &extension) {
        return std::strcmp(extension.extensionName, VK_KHR_SWAPCHAIN_EXTENSION_NAME) == 0;
    });
}

void PickPhysicalDevice() {
    uint32_t count = 0;
    vkEnumeratePhysicalDevices(g_renderer.instance, &count, nullptr);
    std::vector<VkPhysicalDevice> devices(count);
    vkEnumeratePhysicalDevices(g_renderer.instance, &count, devices.data());

    int best_score = -1;
    for (VkPhysicalDevice device : devices) {
        VkPhysicalDeviceProperties properties;
        vkGetPhysicalDeviceProperties(device, &properties);

        uint32_t family;
        if (properties.apiVersion < VK_API_VERSION_1_4 || !HasSwapchain(device) || !FindQueueFamily(device, &family)) {
            continue;
        }

        int score = 0;
        if (properties.deviceType == VK_PHYSICAL_DEVICE_TYPE_DISCRETE_GPU) {
            score = 2;
        } else if (properties.deviceType == VK_PHYSICAL_DEVICE_TYPE_INTEGRATED_GPU) {
            score = 1;
        }
        if (score > best_score) {
            best_score = score;
            g_renderer.physical_device = device;
            g_renderer.queue_family = family;
        }
    }

    if (best_score < 0) {
        Fatal("no GPU supports Vulkan 1.4 and can present to the window");
    }

    VkPhysicalDeviceProperties properties;
    vkGetPhysicalDeviceProperties(g_renderer.physical_device, &properties);
    std::fprintf(stderr, "Vulkan: using %s (Vulkan %u.%u.%u)\n", properties.deviceName, VK_API_VERSION_MAJOR(properties.apiVersion),
                 VK_API_VERSION_MINOR(properties.apiVersion), VK_API_VERSION_PATCH(properties.apiVersion));
}

void CreateDevice() {
    float                   priority = 1.0f;
    VkDeviceQueueCreateInfo queue_info = {};
    queue_info.sType = VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO;
    queue_info.queueFamilyIndex = g_renderer.queue_family;
    queue_info.queueCount = 1;
    queue_info.pQueuePriorities = &priority;

    VkPhysicalDeviceVulkan13Features features13 = {};
    features13.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_3_FEATURES;
    features13.dynamicRendering = VK_TRUE;
    features13.synchronization2 = VK_TRUE;

    const char *extensions[] = {VK_KHR_SWAPCHAIN_EXTENSION_NAME};

    VkDeviceCreateInfo create_info = {};
    create_info.sType = VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO;
    create_info.pNext = &features13;
    create_info.queueCreateInfoCount = 1;
    create_info.pQueueCreateInfos = &queue_info;
    create_info.enabledExtensionCount = 1;
    create_info.ppEnabledExtensionNames = extensions;
    Check(vkCreateDevice(g_renderer.physical_device, &create_info, nullptr, &g_renderer.device), "vkCreateDevice");

    vkGetDeviceQueue(g_renderer.device, g_renderer.queue_family, 0, &g_renderer.queue);
}

VkSurfaceFormatKHR PickSurfaceFormat() {
    uint32_t count = 0;
    vkGetPhysicalDeviceSurfaceFormatsKHR(g_renderer.physical_device, g_renderer.surface, &count, nullptr);
    std::vector<VkSurfaceFormatKHR> formats(count);
    vkGetPhysicalDeviceSurfaceFormatsKHR(g_renderer.physical_device, g_renderer.surface, &count, formats.data());

    for (const VkSurfaceFormatKHR &format : formats) {
        if ((format.format == VK_FORMAT_B8G8R8A8_UNORM || format.format == VK_FORMAT_R8G8B8A8_UNORM) &&
            format.colorSpace == VK_COLOR_SPACE_SRGB_NONLINEAR_KHR) {
            return format;
        }
    }
    return formats[0];
}

void DestroySwapchainResources() {
    for (VkImageView view : g_renderer.swapchain.views) {
        vkDestroyImageView(g_renderer.device, view, nullptr);
    }
    for (VkSemaphore semaphore : g_renderer.swapchain.render_finished) {
        vkDestroySemaphore(g_renderer.device, semaphore, nullptr);
    }
    g_renderer.swapchain.views.clear();
    g_renderer.swapchain.render_finished.clear();
    g_renderer.swapchain.images.clear();
}

bool CreateSwapchain() {
    VkSurfaceCapabilitiesKHR capabilities;
    Check(vkGetPhysicalDeviceSurfaceCapabilitiesKHR(g_renderer.physical_device, g_renderer.surface, &capabilities),
          "vkGetPhysicalDeviceSurfaceCapabilitiesKHR");

    VkExtent2D extent = capabilities.currentExtent;
    if (extent.width == UINT32_MAX) {
        int width = 0;
        int height = 0;
        SDL_GetWindowSizeInPixels(g_renderer.window, &width, &height);
        extent.width = std::clamp(static_cast<uint32_t>(width), capabilities.minImageExtent.width, capabilities.maxImageExtent.width);
        extent.height = std::clamp(static_cast<uint32_t>(height), capabilities.minImageExtent.height, capabilities.maxImageExtent.height);
    }
    if (extent.width == 0 || extent.height == 0) {
        return false;
    }

    uint32_t image_count = capabilities.minImageCount + 1;
    if (capabilities.maxImageCount != 0) {
        image_count = std::min(image_count, capabilities.maxImageCount);
    }

    VkSurfaceFormatKHR format = PickSurfaceFormat();
    VkSwapchainKHR     old_swapchain = g_renderer.swapchain.handle;

    VkSwapchainCreateInfoKHR create_info = {};
    create_info.sType = VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR;
    create_info.surface = g_renderer.surface;
    create_info.minImageCount = image_count;
    create_info.imageFormat = format.format;
    create_info.imageColorSpace = format.colorSpace;
    create_info.imageExtent = extent;
    create_info.imageArrayLayers = 1;
    create_info.imageUsage = VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT | VK_IMAGE_USAGE_TRANSFER_DST_BIT;
    create_info.imageSharingMode = VK_SHARING_MODE_EXCLUSIVE;
    create_info.preTransform = capabilities.currentTransform;
    create_info.compositeAlpha = VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR;
    create_info.presentMode = VK_PRESENT_MODE_FIFO_KHR;
    create_info.clipped = VK_TRUE;
    create_info.oldSwapchain = old_swapchain;
    Check(vkCreateSwapchainKHR(g_renderer.device, &create_info, nullptr, &g_renderer.swapchain.handle), "vkCreateSwapchainKHR");

    if (old_swapchain != VK_NULL_HANDLE) {
        vkDestroySwapchainKHR(g_renderer.device, old_swapchain, nullptr);
    }

    Swapchain &swapchain = g_renderer.swapchain;
    swapchain.format = format.format;
    swapchain.extent = extent;

    uint32_t count = 0;
    vkGetSwapchainImagesKHR(g_renderer.device, swapchain.handle, &count, nullptr);
    swapchain.images.resize(count);
    vkGetSwapchainImagesKHR(g_renderer.device, swapchain.handle, &count, swapchain.images.data());

    swapchain.views.resize(count);
    swapchain.render_finished.resize(count);
    for (uint32_t i = 0; i < count; i++) {
        VkImageViewCreateInfo view_info = {};
        view_info.sType = VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO;
        view_info.image = swapchain.images[i];
        view_info.viewType = VK_IMAGE_VIEW_TYPE_2D;
        view_info.format = swapchain.format;
        view_info.subresourceRange.aspectMask = VK_IMAGE_ASPECT_COLOR_BIT;
        view_info.subresourceRange.levelCount = 1;
        view_info.subresourceRange.layerCount = 1;
        Check(vkCreateImageView(g_renderer.device, &view_info, nullptr, &swapchain.views[i]), "vkCreateImageView");

        VkSemaphoreCreateInfo semaphore_info = {};
        semaphore_info.sType = VK_STRUCTURE_TYPE_SEMAPHORE_CREATE_INFO;
        Check(vkCreateSemaphore(g_renderer.device, &semaphore_info, nullptr, &swapchain.render_finished[i]), "vkCreateSemaphore");
    }
    return true;
}

bool RecreateSwapchain() {
    vkDeviceWaitIdle(g_renderer.device);
    DestroySwapchainResources();
    if (!CreateSwapchain()) {
        return false;
    }
    g_renderer.resized = false;
    return true;
}

void CreateFrames() {
    for (Frame &frame : g_renderer.frames) {
        VkCommandPoolCreateInfo pool_info = {};
        pool_info.sType = VK_STRUCTURE_TYPE_COMMAND_POOL_CREATE_INFO;
        pool_info.flags = VK_COMMAND_POOL_CREATE_TRANSIENT_BIT;
        pool_info.queueFamilyIndex = g_renderer.queue_family;
        Check(vkCreateCommandPool(g_renderer.device, &pool_info, nullptr, &frame.command_pool), "vkCreateCommandPool");

        VkCommandBufferAllocateInfo allocate_info = {};
        allocate_info.sType = VK_STRUCTURE_TYPE_COMMAND_BUFFER_ALLOCATE_INFO;
        allocate_info.commandPool = frame.command_pool;
        allocate_info.level = VK_COMMAND_BUFFER_LEVEL_PRIMARY;
        allocate_info.commandBufferCount = 1;
        Check(vkAllocateCommandBuffers(g_renderer.device, &allocate_info, &frame.command_buffer), "vkAllocateCommandBuffers");

        VkSemaphoreCreateInfo semaphore_info = {};
        semaphore_info.sType = VK_STRUCTURE_TYPE_SEMAPHORE_CREATE_INFO;
        Check(vkCreateSemaphore(g_renderer.device, &semaphore_info, nullptr, &frame.image_available), "vkCreateSemaphore");

        VkFenceCreateInfo fence_info = {};
        fence_info.sType = VK_STRUCTURE_TYPE_FENCE_CREATE_INFO;
        fence_info.flags = VK_FENCE_CREATE_SIGNALED_BIT;
        Check(vkCreateFence(g_renderer.device, &fence_info, nullptr, &frame.in_flight), "vkCreateFence");
    }
}

void TransitionImage(VkCommandBuffer command_buffer, VkImage image, VkImageLayout old_layout, VkImageLayout new_layout,
                     VkPipelineStageFlags2 src_stage, VkAccessFlags2 src_access, VkPipelineStageFlags2 dst_stage, VkAccessFlags2 dst_access) {
    VkImageMemoryBarrier2 barrier = {};
    barrier.sType = VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER_2;
    barrier.srcStageMask = src_stage;
    barrier.srcAccessMask = src_access;
    barrier.dstStageMask = dst_stage;
    barrier.dstAccessMask = dst_access;
    barrier.oldLayout = old_layout;
    barrier.newLayout = new_layout;
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
    vkCmdPipelineBarrier2(command_buffer, &dependency);
}

} // namespace

void RendererInit(SDL_Window *window) {
    g_renderer = {};
    g_renderer.window = window;
    CreateInstance();
    CreateSurface();
    PickPhysicalDevice();
    CreateDevice();
    CreateSwapchain();
    CreateFrames();
}

void RendererShutdown() {
    if (g_renderer.device == VK_NULL_HANDLE) {
        return;
    }
    vkDeviceWaitIdle(g_renderer.device);

    for (Frame &frame : g_renderer.frames) {
        vkDestroyFence(g_renderer.device, frame.in_flight, nullptr);
        vkDestroySemaphore(g_renderer.device, frame.image_available, nullptr);
        vkDestroyCommandPool(g_renderer.device, frame.command_pool, nullptr);
    }
    DestroySwapchainResources();
    vkDestroySwapchainKHR(g_renderer.device, g_renderer.swapchain.handle, nullptr);
    vkDestroyDevice(g_renderer.device, nullptr);
    SDL_Vulkan_DestroySurface(g_renderer.instance, g_renderer.surface, nullptr);

    if (g_renderer.messenger != VK_NULL_HANDLE) {
        auto destroy_messenger = reinterpret_cast<PFN_vkDestroyDebugUtilsMessengerEXT>(
            vkGetInstanceProcAddr(g_renderer.instance, "vkDestroyDebugUtilsMessengerEXT"));
        destroy_messenger(g_renderer.instance, g_renderer.messenger, nullptr);
    }
    vkDestroyInstance(g_renderer.instance, nullptr);
    g_renderer = {};
}

void RendererResize() {
    g_renderer.resized = true;
}

bool RendererBeginFrame() {
    if ((g_renderer.resized || g_renderer.swapchain.images.empty()) && !RecreateSwapchain()) {
        SDL_Delay(16);
        return false;
    }

    Frame &frame = g_renderer.frames[g_renderer.frame_index];
    Check(vkWaitForFences(g_renderer.device, 1, &frame.in_flight, VK_TRUE, UINT64_MAX), "vkWaitForFences");

    VkResult result = vkAcquireNextImageKHR(g_renderer.device, g_renderer.swapchain.handle, UINT64_MAX, frame.image_available,
                                            VK_NULL_HANDLE, &g_renderer.image_index);
    if (result == VK_ERROR_OUT_OF_DATE_KHR) {
        RecreateSwapchain();
        return false;
    }
    if (result != VK_SUBOPTIMAL_KHR) {
        Check(result, "vkAcquireNextImageKHR");
    }

    Check(vkResetFences(g_renderer.device, 1, &frame.in_flight), "vkResetFences");
    Check(vkResetCommandPool(g_renderer.device, frame.command_pool, 0), "vkResetCommandPool");

    VkCommandBufferBeginInfo begin_info = {};
    begin_info.sType = VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO;
    begin_info.flags = VK_COMMAND_BUFFER_USAGE_ONE_TIME_SUBMIT_BIT;
    Check(vkBeginCommandBuffer(frame.command_buffer, &begin_info), "vkBeginCommandBuffer");

    VkImage image = g_renderer.swapchain.images[g_renderer.image_index];
    TransitionImage(frame.command_buffer, image, VK_IMAGE_LAYOUT_UNDEFINED, VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL,
                    VK_PIPELINE_STAGE_2_COLOR_ATTACHMENT_OUTPUT_BIT, VK_ACCESS_2_NONE, VK_PIPELINE_STAGE_2_COLOR_ATTACHMENT_OUTPUT_BIT,
                    VK_ACCESS_2_COLOR_ATTACHMENT_WRITE_BIT);

    VkRenderingAttachmentInfo color_attachment = {};
    color_attachment.sType = VK_STRUCTURE_TYPE_RENDERING_ATTACHMENT_INFO;
    color_attachment.imageView = g_renderer.swapchain.views[g_renderer.image_index];
    color_attachment.imageLayout = VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL;
    color_attachment.loadOp = VK_ATTACHMENT_LOAD_OP_CLEAR;
    color_attachment.storeOp = VK_ATTACHMENT_STORE_OP_STORE;
    color_attachment.clearValue.color = g_renderer.clear_color;

    VkRenderingInfo rendering_info = {};
    rendering_info.sType = VK_STRUCTURE_TYPE_RENDERING_INFO;
    rendering_info.renderArea.extent = g_renderer.swapchain.extent;
    rendering_info.layerCount = 1;
    rendering_info.colorAttachmentCount = 1;
    rendering_info.pColorAttachments = &color_attachment;
    vkCmdBeginRendering(frame.command_buffer, &rendering_info);
    return true;
}

void RendererEndFrame() {
    Frame      &frame = g_renderer.frames[g_renderer.frame_index];
    VkSemaphore render_finished = g_renderer.swapchain.render_finished[g_renderer.image_index];

    vkCmdEndRendering(frame.command_buffer);
    TransitionImage(frame.command_buffer, g_renderer.swapchain.images[g_renderer.image_index], VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL,
                    VK_IMAGE_LAYOUT_PRESENT_SRC_KHR, VK_PIPELINE_STAGE_2_COLOR_ATTACHMENT_OUTPUT_BIT, VK_ACCESS_2_COLOR_ATTACHMENT_WRITE_BIT,
                    VK_PIPELINE_STAGE_2_NONE, VK_ACCESS_2_NONE);
    Check(vkEndCommandBuffer(frame.command_buffer), "vkEndCommandBuffer");

    VkSemaphoreSubmitInfo wait_info = {};
    wait_info.sType = VK_STRUCTURE_TYPE_SEMAPHORE_SUBMIT_INFO;
    wait_info.semaphore = frame.image_available;
    wait_info.stageMask = VK_PIPELINE_STAGE_2_COLOR_ATTACHMENT_OUTPUT_BIT;

    VkSemaphoreSubmitInfo signal_info = {};
    signal_info.sType = VK_STRUCTURE_TYPE_SEMAPHORE_SUBMIT_INFO;
    signal_info.semaphore = render_finished;
    signal_info.stageMask = VK_PIPELINE_STAGE_2_COLOR_ATTACHMENT_OUTPUT_BIT;

    VkCommandBufferSubmitInfo command_info = {};
    command_info.sType = VK_STRUCTURE_TYPE_COMMAND_BUFFER_SUBMIT_INFO;
    command_info.commandBuffer = frame.command_buffer;

    VkSubmitInfo2 submit_info = {};
    submit_info.sType = VK_STRUCTURE_TYPE_SUBMIT_INFO_2;
    submit_info.waitSemaphoreInfoCount = 1;
    submit_info.pWaitSemaphoreInfos = &wait_info;
    submit_info.commandBufferInfoCount = 1;
    submit_info.pCommandBufferInfos = &command_info;
    submit_info.signalSemaphoreInfoCount = 1;
    submit_info.pSignalSemaphoreInfos = &signal_info;
    Check(vkQueueSubmit2(g_renderer.queue, 1, &submit_info, frame.in_flight), "vkQueueSubmit2");

    VkPresentInfoKHR present_info = {};
    present_info.sType = VK_STRUCTURE_TYPE_PRESENT_INFO_KHR;
    present_info.waitSemaphoreCount = 1;
    present_info.pWaitSemaphores = &render_finished;
    present_info.swapchainCount = 1;
    present_info.pSwapchains = &g_renderer.swapchain.handle;
    present_info.pImageIndices = &g_renderer.image_index;
    VkResult result = vkQueuePresentKHR(g_renderer.queue, &present_info);
    if (result == VK_ERROR_OUT_OF_DATE_KHR || result == VK_SUBOPTIMAL_KHR) {
        g_renderer.resized = true;
    } else {
        Check(result, "vkQueuePresentKHR");
    }

    g_renderer.frame_index = (g_renderer.frame_index + 1) % kFramesInFlight;
}

void RendererSetClearColor(int r, int g, int b) {
    g_renderer.clear_color.float32[0] = static_cast<float>(r) / 255.0f;
    g_renderer.clear_color.float32[1] = static_cast<float>(g) / 255.0f;
    g_renderer.clear_color.float32[2] = static_cast<float>(b) / 255.0f;
    g_renderer.clear_color.float32[3] = 1.0f;
}
