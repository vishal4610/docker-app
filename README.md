# docker-app

## commands
---
`docker build -t file_generator:latest .`
`docker run --rm -v $(pwd):/app file_generator:latest`
`docker run -it --rm -v $(pwd):/app file_generator:latest cat file_with_lines.txt`