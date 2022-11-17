# DockerAwsSdkCPP

Example usage:

- `/files`: all sources
- `/files/build`: build directory (need to be created before executing `cmake`)

```bash
docker run -it -v $(pwd):/files --workdir /files/build matbabs/aws-sdk-cpp:1.0.0 "cmake" ".." "-DCMAKE_BUILD_TYPE=Release" "-DCMAKE_PREFIX_PATH=/install"
docker run -it -v $(pwd):/files --workdir /files/build matbabs/aws-sdk-cpp:1.0.0 "make"
docker run -it -v $(pwd):/files --workdir /files/build matbabs/aws-sdk-cpp:1.0.0 "make" ".." "aws-lambda-package-${lambda}"
```
