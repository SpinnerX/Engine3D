#pragma once
#include <memory>
#include <engine3d/Core/core.h>
// #include <spdlog/spdlog.h>
// #include <spdlog/fmt/ostr.h>
#include "fmt/os.h"
#include "fmt/ostream.h"

// #include "spdlog/async.h"
// #include "spdlog/async_logger-inl.h"
// #include "spdlog/async_logger.h"
// #include "spdlog/cfg/argv.h"
// #include "spdlog/cfg/env.h"
// #include "spdlog/cfg/helpers-inl.h"
// #include "spdlog/cfg/helpers.h"
// #include "spdlog/common-inl.h"
// #include "spdlog/common.h"
// #include "spdlog/details/backtracer-inl.h"
// #include "spdlog/details/backtracer.h"
#include "spdlog/spdlog.h"

namespace Engine3D{

    class ENGINE_API EngineLogger{
    public:
        EngineLogger();
        ~EngineLogger();

        static void Initialize();

        // If either CoreLogger or client is nullptr
        // Then we should automatically terminate the app.
        // This is because if we continue, we will segfault due to the CoreLogger/ClientLogger not being initialized
        static bool isLoggerInit() {
            return (coreLogger == nullptr || clientLogger == nullptr);
        }

        inline static std::shared_ptr<spdlog::logger>& GetCoreLogger(){
            if(EngineLogger::isLoggerInit()){
                // spdlog::fatal("EngineLogger::Init() needs to be called!\nEngineLogger::Init() returns a nullptr");
                spdlog::log(spdlog::level::critical, "EngineLogger::Init() needs to be called!\n");
                std::terminate();
            }
            return coreLogger;
        }

        inline static std::shared_ptr<spdlog::logger>& GetClientLogger() {
            if(EngineLogger::isLoggerInit()){
                // Logger::fatal("EngineLogger::Init() needs to be called!\n");
                spdlog::log(spdlog::level::critical, "EngineLogger::Init() needs to be called!\n");
                std::terminate();
            }
            
            return clientLogger;
        }

    private:
        // static std::shared_ptr<Logger::Log> CoreLogger;
        // static std::shared_ptr<Logger::Log> ClientLogger;
        static std::shared_ptr<spdlog::logger> coreLogger;
        static std::shared_ptr<spdlog::logger> clientLogger;
    };
};

// ------------ Core logs ------------

template<typename... T>
inline void CoreLogTrace(spdlog::format_string_t<T...> fmt, T&&... args) {
    Engine3D::EngineLogger::GetCoreLogger()->trace(fmt, std::forward<T>(args)...);
}

template<typename... T>
inline void CoreLogInfo(spdlog::format_string_t<T...> fmt, T&&... args) {
    Engine3D::EngineLogger::GetCoreLogger()->info(fmt, std::forward<T>(args)...);
}

template<typename... T>
inline void CoreLogWarn(spdlog::format_string_t<T...> fmt, T &&...args) {
    Engine3D::EngineLogger::GetCoreLogger()->warn(fmt, std::forward<T>(args)...);
}

template<typename... T>
inline void CoreLogError(spdlog::format_string_t<T...> fmt, T &&...args) {
    Engine3D::EngineLogger::GetCoreLogger()->error(fmt, std::forward<T>(args)...);
}

template<typename... T>
inline void CoreLogFatal(spdlog::format_string_t<T...> fmt, T &&...args) {
    // Engine3D::EngineLogger::GetCoreLogger()->fatal(fmt, std::forward<T>(args)...);
    Engine3D::EngineLogger::GetCoreLogger()->critical(fmt, std::forward<T>(args)...);
}

// ------------ Client logs ------------
template<typename... T>
inline void ClientLogTrace(spdlog::format_string_t<T...> fmt, T &&...args) {
    Engine3D::EngineLogger::GetClientLogger()->trace(fmt, std::forward<T>(args)...);
}

template<typename... T>
inline void ClientLogInfo(spdlog::format_string_t<T...> fmt, T &&...args) {
    Engine3D::EngineLogger::GetClientLogger()->info(fmt, std::forward<T>(args)...);
}

template<typename... T>
inline void ClientLogWarn(spdlog::format_string_t<T...> fmt, T &&...args) {
    Engine3D::EngineLogger::GetClientLogger()->warn(fmt, std::forward<T>(args)...);
}

template<typename... T>
inline void ClientLogError(spdlog::format_string_t<T...> fmt, T &&...args) {
    Engine3D::EngineLogger::GetClientLogger()->error(fmt, std::forward<T>(args)...);
}

template<typename... T>
inline void ClientLogFatal(spdlog::format_string_t<T...> fmt, T &&...args) {
    Engine3D::EngineLogger::GetClientLogger()->critical(fmt, std::forward<T>(args)...);
}