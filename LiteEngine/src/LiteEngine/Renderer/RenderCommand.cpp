#include "hzpch.h"
#include "RenderCommand.h"

#include "Platform/OpenGL/OpenGLRendererAPI.h"

namespace LiteEngine {

    RendererAPI* RenderCommand::s_RendererAPI = new OpenGLRendererAPI;

}