#include "LiteEngine.h"
#include "LiteEngine/Events/Event.h"
#include "LiteEngine/Log.h"
#include "spdlog/fmt/ostr.h"

// Force discrete GPU
extern "C" {
__declspec(dllexport) unsigned long NvOptimusEnablement = 1;
__declspec(dllexport) int AmdPowerXpressRequestHighPerformance = 1;
}

class ExampleLayer : public LiteEngine::Layer {
public:
  ExampleLayer() : Layer("Example") {}

  void OnUpdate() override 
  { 
	  LE_INFO("ExampleLayer::Update");
  }

  void OnEvent(LiteEngine::Event &event) override 
  {
	  LE_TRACE("{0}", event.ToString());
  }
};

class Sandbox : public LiteEngine::Application {
public:
  Sandbox() 
  {
      PushLayer(new ExampleLayer()); 
	  PushOverlay(new LiteEngine::ImGuiLayer());
  }

  ~Sandbox() {}
};

LiteEngine::Application *LiteEngine::CreateApplication() {
  return new Sandbox();
}