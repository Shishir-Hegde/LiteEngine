#pragma once

#include "Core.h"

#include "Windows.h"
#include "LiteEngine/LayerStack.h"
#include "LiteEngine/Events/Event.h"
#include "LiteEngine/Events/ApplicationEvent.h"

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
	private:
		bool OnWindowClose(WindowCloseEvent& e);

		std::unique_ptr<Window> m_Window;
		bool m_Running = true;
		LayerStack m_LayerStack;
	};

	// To be defined in CLIENT
	Application* CreateApplication();

}