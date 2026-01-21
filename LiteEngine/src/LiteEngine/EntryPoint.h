#pragma once

#ifdef LE_PLATFORM_WINDOWS

extern LiteEngine::Application* LiteEngine::CreateApplication();

int main(int argc, char** argv)
{
	auto app = LiteEngine::CreateApplication();
	app->Run();
	delete app;
}

#endif