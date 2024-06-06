#pragma once
#include <engine3d/Core/core.h>
#include <engine3d/Core/Layer.h>


namespace Engine3D{

    class ImGuiLayer : public Layer{
    public:
        ImGuiLayer();
        ~ImGuiLayer();

        static void Begin();

        static void End();

        void SetBlockedEvents(bool isBlocked);

        template<typename UFunction>
        void UpdateUI(const UFunction& function){
            this->Begin();
            function();
            this->End();
        }


    private:

        void Attach() override;

        void Detach() override;

        void UpdateEvent(Event& event) override;

        void UpdateLayer(Timestep ts) override;

        void UIRender() override;

        void SetDarkThemedColors();

    private:

    private:
        bool m_IsBlockingEvents = true;
        float m_Time = 0.0f;
    };
};