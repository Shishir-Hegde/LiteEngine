#include "hzpch.h"
#include "LiteEngine.h"

class Sandbox : public LiteEngine::Application
{
public:
	Sandbox()
	{
	}
	~Sandbox()
	{
	}
};

LiteEngine::Application* LiteEngine::CreateApplication()
{
	return new Sandbox();
}