# docker-app

## commands
---
`docker build -t file_generator:latest .`
### linux
`docker run --rm -v $(pwd):/app file_generator:latest`
`docker run -it --rm -v $(pwd):/app file_generator:latest cat file_with_lines.txt`

### windows
`docker run --rm -v %cd%:/app file_generator:latest`
`docker run -it --rm -v %cd%:/app file_generator:latest cat file_with_lines.txt`