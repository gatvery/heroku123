#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�뭪binstall.sh �Wmo�6��_qQ��&+Ζ��F� F];��-[�
�D�l$Q!)'����Ӌe��-�bˇH&�ǻ��=G�82n�o���\G��yݟ_�Z�ݏ�n���V�r�n:���o��l8�4M�F��l`����l�ǳy4*)K"M;���\.(�_�F��x����m#�[O*|��3�������zY[z�<��p�x��u`p�Kh�Fڱ��ẵ���XG�=qٿ0�YP%Jv-ID=_�ٖ��uSw�q6ޝ$^����.f�_�ڷm�.XA�Rے��X�N{I�*�m���`�
:C<�~U�VR�kV@��6�N&���hf� r��8�A�X�#�@���=��<� ���F8g���9  ���
�=�{E�;xb!��������#���B?*TC�>�C[ZKӷ<RJ��	�/�0��͘i�Ѵ쫁gh�Dp@�G̯��
��àȣM�C���9jG�9�s�K�H���2��#�G�㛑��s��w��jX�L��{�]f9�#2%������hҿ0G�񛞺�Y�c�ص�g�*������?�?ӠPq�����sxmƥGZ
�z%b^d��"����ɟ�ZZ�/P�r�X6vr0ж��m:�߇����H�$�cz=TN&ᒅ���K��|EŖ}�0"�ǥ"�e<A�\���cy��M�����	�?��y������[�>h�s�a���N�8={���uNQ����i�ȖG"�J\ʵگ��*��o���8�N>~�j���Hm�A"Ⱥ�c�O�>������m�K�(�P?O��YQ�����$�z�5p"JM�6O�����LD���|��^����|>���&:�����Š��5����G��N�CS��y�ם:r�5q��׬$p����\�,e� ��tv��EFl��F�ݒ0ǒV�1���D�Jl�MT��hmN�X&6�H���6T �4��Q��Z���-���G��V~�Q�ⓠAc��'��u(���4�A<t����w�]�J���D=����|�Mc��m�VmbvZ�V�u\�����$J��h��{���}w_���D�Jyh5��,ԯ]�-�_�e�S�#
�sB��?и3-�W;v�zB��|
t;^F�\{�@~�雈o���Y~�ɘ�.g���D������4ػ��+��J�nq,}%��b�q�*�w���Ć/��f�:�$���X"I�[����b㩈�RhD��N�≂�W�#+������}��u�����}E�ˈ�T���kJ�V{��7�'��Y4  