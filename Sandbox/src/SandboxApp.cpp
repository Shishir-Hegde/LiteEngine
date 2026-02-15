#include "LiteEngine.h"
#include "spdlog/fmt/ostr.h"
#include "LiteEngine/Events/Event.h"
#include "LiteEngine/Log.h"

class ExampleLayer : public LiteEngine::Layer
{
public:
	ExampleLayer()
		: Layer("Example")
	{
	}

	void OnUpdate() override
	{ 
		LE_INFO("ExampleLayer::Update");
	}

	void OnEvent(LiteEngine::Event& event) override
	{
		LE_TRACE("{0}", event.ToString());
	}

};

class Sandbox : public LiteEngine::Application
{
public:
	Sandbox()
	{
		PushLayer(new ExampleLayer());
	}

	~Sandbox()
	{

	}

};

LiteEngine::Application* LiteEngine::CreateApplication()
{
	return new Sandbox();
}