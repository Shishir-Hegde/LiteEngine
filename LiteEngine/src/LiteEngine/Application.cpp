#include "hzpch.h"
#include "Application.h"
#include "Events/ApplicationEvent.h"
#include "Log.h"

namespace LiteEngine
{
	Application::Application()
	{
	}
	Application::~Application()
	{
	}

	void Application::Run()
	{
		WindowResizeEvent e(1280, 720);
		LE_TRACE(e.ToString());
		while (true);
	}
}