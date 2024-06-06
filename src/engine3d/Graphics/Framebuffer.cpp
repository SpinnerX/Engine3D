#include <engine3d/engine3dPrecompiledHeader.h>
#include <engine3d/Graphics/Framebuffer.h>
#include <engine3d/OpenGL/OpenGLFramebuffer.h>

namespace Engine3D{

    Ref<Framebuffer> Framebuffer::Create(const FramebufferMetaData& framebufferMetaData){
        switch(Pipeline::CurrentAPI()){
        case API::OPENGL: return CreateRef<OpenGLFramebuffer>(framebufferMetaData);
        default: break;
        }

        CoreLogError("In Framebuffer::Create() Pipeline::CurrentAPI() was enabled to an unsupported API!");
        assert(false);
        return nullptr;
    }

    void Framebuffer::ApplyResources(){}

    void Framebuffer::ReleaseResources(){}

    int Framebuffer::ReadPixel(uint32_t attachmentIdx, int x, int y){
        return GetPixelData(attachmentIdx, x, y);
    }

    void Framebuffer::ClearAttachements(uint32_t attachmentIdx, int data) {
        ClearAttachmentData(attachmentIdx, data);
    }

    uint32_t Framebuffer::GetAttachmentID(uint32_t idx) const {
        return GetPixelAttachmentID(idx);
    }

    int Framebuffer::MaxFramebufferSize(){
        return OpenGLFramebuffer::GetMaxFramebufferSize();
    }

    // void Framebuffer::Resize(Ref<Framebuffer>&& framebuffer, int x, int y) {

    // }

};