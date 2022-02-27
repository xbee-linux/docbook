#!/bin/bash
set -e

if [ ! -e {{ .pack.xbeeOut }}/etc/xml/catalog ]; then
    xmlcatalog --noout --create {{ .pack.xbeeOut }}/etc/xml/catalog
fi &&
xmlcatalog --noout --add "delegatePublic" \
    "-//OASIS//ENTITIES DocBook XML" \
    "file:///etc/xml/docbook" \
    {{ .pack.xbeeOut }}/etc/xml/catalog &&
xmlcatalog --noout --add "delegatePublic" \
    "-//OASIS//DTD DocBook XML" \
    "file:///etc/xml/docbook" \
    {{ .pack.xbeeOut }}/etc/xml/catalog &&
xmlcatalog --noout --add "delegateSystem" \
    "http://www.oasis-open.org/docbook/" \
    "file:///etc/xml/docbook" \
    {{ .pack.xbeeOut }}/etc/xml/catalog &&
xmlcatalog --noout --add "delegateURI" \
    "http://www.oasis-open.org/docbook/" \
    "file:///etc/xml/docbook" \
    {{ .pack.xbeeOut }}/etc/xml/catalog