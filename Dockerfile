FROM node:latest as build
WORKDIR /usr/local/app
COPY ./ /usr/local/app/
RUN npm ci
RUN npm run build

FROM nginx:latest
COPY --from=build /usr/local/app/dist/useFull/browser /usr/share/nginx/html
EXPOSE 80
