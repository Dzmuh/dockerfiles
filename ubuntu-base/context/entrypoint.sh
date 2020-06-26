#!/usr/bin/env bash
#
# Устанавливает указанное пользовательское окружение и запускает указанное приложение.
#
set -e

# Применяет идентификатор пользователя/группы, что позволяет ему быть владельцем новых файлов.
readonly NO_SUCH_GROUP_EXISTS=$(grep "^${GIVEN_GROUP}" /etc/group |grep ":${GIVEN_GROUP_ID}:"; echo $?)
if [[ "${NO_SUCH_GROUP_EXISTS}" = "1" ]]; then
    groupadd --gid "${GIVEN_GROUP_ID}" --non-unique "${GIVEN_GROUP}"
fi

readonly NO_SUCH_USER_EXISTS=$(grep "^${GIVEN_USER}" /etc/passwd |grep ":${GIVEN_USER_ID}:"; echo $?)
if [[ "${NO_SUCH_USER_EXISTS}" = "1" ]]; then
    useradd --create-home --non-unique --uid "${GIVEN_USER_ID}" --gid "${GIVEN_GROUP_ID}" "${GIVEN_USER}"
    if [[ -n "${ENTRYPOINT_GROUPS}" ]]; then
        usermod -a -G "${ENTRYPOINT_GROUPS}" "${GIVEN_USER}"
    fi
else
if [[ "${GIVEN_USER_ID}" = "0" ]]; then
        cp --recursive --no-dereference /etc/skel/. /root/
    fi
fi

if [[ ! "${HOST_GROUP_ID}" = "" ]]; then
    groupadd --gid "${HOST_GROUP_ID}" "${HOST_GROUP}"
    usermod -a -G "${HOST_GROUP}" "${GIVEN_USER}"
fi

if [[ ! "${ENTRYPOINT_WORKDIR}" = "" ]]; then
    # Намеренно добавлено, что бы установить WORKDIR при старте контейнера.
    cd "${ENTRYPOINT_WORKDIR}"
fi

# Утилита 'gosu' используется для выполнения исполняемого файла от имени только что созданного пользователя.
# Утилита 'gosu' позволяет делать так, что бы пользователь контейнера имел тот-же UID что и пользователь создавший контейнер.
# (gosu это 1:1 тоже что и "docker --user")
if [[ "${ENTRYPOINT_AS_ROOT:=no}" = "yes" ]]; then
    gosu root "$@"
else
    gosu "${GIVEN_USER_ID}" "$@"
fi
