ARG BASE_REPO=docker.io
ARG BASE_ORG=library
ARG BASE_IMAGE=postgres
ARG BASE_TAG=15-alpine
ARG LLVM_VERSION=15

FROM ${BASE_REPO}/${BASE_ORG}/${BASE_IMAGE}:${BASE_TAG}

RUN apk add --no-cache py-pip perl-dev build-base "clang${LLVM_VERSION}" "llvm${LLVM_VERSION}" \
	&& pip install --no-cache-dir pgxnclient \
	&& cpan TAP::Parser::SourceHandler::pgTAP \
	&& pgxn install pgtap
