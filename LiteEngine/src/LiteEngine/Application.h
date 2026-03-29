#pragma once

#include "Core.h"

#include "Windows.h"
#include "LiteEngine/LayerStack.h"
#include "LiteEngine/Events/Event.h"
#include "LiteEngine/Events/ApplicationEvent.h"

#include "LiteEngine/ImGui/ImGuiLayer.h"
#include "LiteEngine/Renderer/Shader.h"
#include "LiteEngine/Renderer/Buffer.h"
#include "LiteEngine/Renderer/VertexArray.h"

struct ImGuiContext;

namespace LiteEngine {

	class LITEENGINE_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();

		void OnEvent(Event& e);

		void PushLayer(Layer* layer);
		void PushOverlay(Layer* layer);

		inline Window& GetWindow() { return *m_Window; }

		inline static Application& Get() { return *s_Instance; }
		ImGuiContext* GetImGuiContext();
	private:
		bool OnWindowClose(WindowCloseEvent& e);

		std::unique_ptr<Window> m_Window;
		ImGuiLayer* m_ImGuiLayer;
		bool m_Running = true;
		LayerStack m_LayerStack;

		std::shared_ptr<Shader> m_Shader;
		std::shared_ptr<VertexArray> m_VertexArray;

		std::shared_ptr<Shader> m_BlueShader;
		std::shared_ptr<VertexArray> m_SquareVA;
	private:
		static Application* s_Instance;
	};

	// To be defined in CLIENT
	Application* CreateApplication();

}