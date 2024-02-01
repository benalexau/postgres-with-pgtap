ARG BASE_REPO=docker.io
ARG BASE_ORG=library
ARG BASE_IMAGE=postgres
ARG BASE_TAG=15-alpine

FROM ${BASE_REPO}/${BASE_ORG}/${BASE_IMAGE}:${BASE_TAG}

ARG LLVM_VERSION=15

RUN apk add --no-cache py-pip pipx perl-dev build-base "clang${LLVM_VERSION}" "llvm${LLVM_VERSION}" \
	&& pipx ensurepath \
	&& pipx install pgxnclient \
	&& cpan TAP::Parser::SourceHandler::pgTAP

RUN pgxn install pgtap
