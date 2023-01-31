@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem

@if "%DEBUG%"=="" @echo off
@rem ##########################################################################
@rem
@rem  app-books startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%"=="" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Resolve any "." and ".." in APP_HOME to make it shorter.
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

@rem Add default JVM options here. You can also use JAVA_OPTS and APP_BOOKS_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if %ERRORLEVEL% equ 0 goto execute

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto execute

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\app-books.jar;%APP_HOME%\lib\helidon-microprofile-server-2.5.1.jar;%APP_HOME%\lib\jersey-media-json-binding-2.35.jar;%APP_HOME%\lib\helidon-dbclient-jdbc-2.5.1.jar;%APP_HOME%\lib\helidon-dbclient-common-2.5.1.jar;%APP_HOME%\lib\helidon-dbclient-2.5.1.jar;%APP_HOME%\lib\HikariCP-5.0.1.jar;%APP_HOME%\lib\postgresql-42.5.1.jar;%APP_HOME%\lib\flyway-core-9.12.0.jar;%APP_HOME%\lib\jandex-2.3.1.Final.jar;%APP_HOME%\lib\helidon-webserver-static-content-2.5.1.jar;%APP_HOME%\lib\helidon-webserver-jersey-2.5.1.jar;%APP_HOME%\lib\helidon-webserver-2.5.1.jar;%APP_HOME%\lib\helidon-jersey-server-2.5.1.jar;%APP_HOME%\lib\helidon-jersey-client-2.5.1.jar;%APP_HOME%\lib\helidon-jersey-media-jsonp-2.5.1.jar;%APP_HOME%\lib\helidon-media-jsonp-2.5.1.jar;%APP_HOME%\lib\helidon-media-common-2.5.1.jar;%APP_HOME%\lib\helidon-microprofile-config-2.5.1.jar;%APP_HOME%\lib\helidon-microprofile-cdi-2.5.1.jar;%APP_HOME%\lib\helidon-config-yaml-mp-2.5.1.jar;%APP_HOME%\lib\helidon-config-yaml-2.5.1.jar;%APP_HOME%\lib\helidon-config-encryption-2.5.1.jar;%APP_HOME%\lib\helidon-common-key-util-2.5.1.jar;%APP_HOME%\lib\helidon-common-configurable-2.5.1.jar;%APP_HOME%\lib\helidon-config-mp-2.5.1.jar;%APP_HOME%\lib\helidon-tracing-config-2.5.1.jar;%APP_HOME%\lib\helidon-config-object-mapping-2.5.1.jar;%APP_HOME%\lib\helidon-config-2.5.1.jar;%APP_HOME%\lib\weld-se-core-2.5.1.jar;%APP_HOME%\lib\helidon-common-http-2.5.1.jar;%APP_HOME%\lib\helidon-common-context-2.5.1.jar;%APP_HOME%\lib\helidon-common-reactive-2.5.1.jar;%APP_HOME%\lib\helidon-common-mapper-2.5.1.jar;%APP_HOME%\lib\helidon-logging-common-2.5.1.jar;%APP_HOME%\lib\helidon-common-media-type-2.5.1.jar;%APP_HOME%\lib\helidon-common-service-loader-2.5.1.jar;%APP_HOME%\lib\helidon-common-crypto-2.5.1.jar;%APP_HOME%\lib\helidon-common-2.5.1.jar;%APP_HOME%\lib\jersey-hk2-2.35.jar;%APP_HOME%\lib\jersey-media-json-processing-2.35.jar;%APP_HOME%\lib\jersey-server-2.35.jar;%APP_HOME%\lib\jersey-client-2.35.jar;%APP_HOME%\lib\jersey-common-2.35.jar;%APP_HOME%\lib\jersey-weld2-se-2.35.jar;%APP_HOME%\lib\jersey-cdi1x-2.35.jar;%APP_HOME%\lib\jackson-core-2.14.0.jar;%APP_HOME%\lib\jackson-dataformat-toml-2.14.0.jar;%APP_HOME%\lib\jackson-databind-2.14.0.jar;%APP_HOME%\lib\jackson-annotations-2.14.0.jar;%APP_HOME%\lib\opentracing-util-0.33.0.jar;%APP_HOME%\lib\opentracing-noop-0.33.0.jar;%APP_HOME%\lib\opentracing-api-0.33.0.jar;%APP_HOME%\lib\jakarta.xml.bind-api-2.3.3.jar;%APP_HOME%\lib\jakarta.ws.rs-api-2.1.6.jar;%APP_HOME%\lib\weld-spi-3.1.SP2.jar;%APP_HOME%\lib\weld-api-3.1.SP2.jar;%APP_HOME%\lib\jakarta.enterprise.cdi-api-2.0.2.jar;%APP_HOME%\lib\jakarta.el-api-3.0.3.jar;%APP_HOME%\lib\jakarta.interceptor-api-1.2.5.jar;%APP_HOME%\lib\jakarta.annotation-api-1.3.5.jar;%APP_HOME%\lib\jakarta.inject-api-1.0.jar;%APP_HOME%\lib\yasson-1.0.11.jar;%APP_HOME%\lib\jakarta.json.bind-api-1.0.2.jar;%APP_HOME%\lib\jakarta.activation-api-1.2.2.jar;%APP_HOME%\lib\jakarta.json-1.1.6.jar;%APP_HOME%\lib\jakarta.json-1.1.6-module.jar;%APP_HOME%\lib\netty-codec-http2-4.1.77.Final.jar;%APP_HOME%\lib\netty-codec-http-4.1.77.Final.jar;%APP_HOME%\lib\netty-handler-4.1.77.Final.jar;%APP_HOME%\lib\netty-codec-4.1.77.Final.jar;%APP_HOME%\lib\netty-transport-4.1.77.Final.jar;%APP_HOME%\lib\netty-buffer-4.1.77.Final.jar;%APP_HOME%\lib\snakeyaml-1.30.jar;%APP_HOME%\lib\microprofile-config-api-1.4.jar;%APP_HOME%\lib\slf4j-api-1.7.32.jar;%APP_HOME%\lib\jakarta.validation-api-2.0.2.jar;%APP_HOME%\lib\weld-environment-common-3.1.6.Final.jar;%APP_HOME%\lib\jboss-classfilewriter-1.2.5.Final.jar;%APP_HOME%\lib\jboss-logging-3.2.1.Final.jar;%APP_HOME%\lib\netty-resolver-4.1.77.Final.jar;%APP_HOME%\lib\netty-common-4.1.77.Final.jar;%APP_HOME%\lib\checker-qual-3.5.0.jar;%APP_HOME%\lib\osgi-resource-locator-1.0.3.jar;%APP_HOME%\lib\weld-core-impl-2.5.1.jar;%APP_HOME%\lib\hk2-locator-2.6.1.jar;%APP_HOME%\lib\javassist-3.25.0-GA.jar;%APP_HOME%\lib\jsonp-jaxrs-1.1.6.jar;%APP_HOME%\lib\jakarta.inject-2.6.1.jar;%APP_HOME%\lib\hk2-api-2.6.1.jar;%APP_HOME%\lib\aopalliance-repackaged-2.6.1.jar;%APP_HOME%\lib\hk2-utils-2.6.1.jar


@rem Execute app-books
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %APP_BOOKS_OPTS%  -classpath "%CLASSPATH%" com.programacion.Main %*

:end
@rem End local scope for the variables with windows NT shell
if %ERRORLEVEL% equ 0 goto mainEnd

:fail
rem Set variable APP_BOOKS_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
set EXIT_CODE=%ERRORLEVEL%
if %EXIT_CODE% equ 0 set EXIT_CODE=1
if not ""=="%APP_BOOKS_EXIT_CONSOLE%" exit %EXIT_CODE%
exit /b %EXIT_CODE%

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
