#!/bin/bash
#
# Encrypted by Rangga Fajar Oktariansyah (Anak Gabut Thea)
#
# This file has been encrypted with BZip2 Shell Exec <https://github.com/FajarKim/bz2-shell>
# The filename 'main.sh' encrypted at Sun Jan 28 06:50:05 UTC 2024
# I try invoking the compressed executable with the original name
# (for programs looking at their name).  We also try to retain the original
# file permissions on the compressed file.  For safety reasons, bzsh will
# not create setuid or setgid shell scripts.
#
# WARNING: the first line of this file must be either : or #!/bin/bash
# The : is required for some old versions of csh.
# On Ultrix, /bin/bash is too buggy, change the first line to: #!/bin/bash5
#
# Don't forget to follow me on <https://github.com/FajarKim>
skip=75

tab='	'
nl='
'
IFS=" $tab$nl"

# Make sure important variables exist if not already defined
# $USER is defined by login(1) which is not always executed (e.g. containers)
# POSIX: https://pubs.opengroup.org/onlinepubs/009695299/utilities/id.html
USER=${USER:-$(id -u -n)}
# $HOME is defined at the time of login, but it could be unset. If it is unset,
# a tilde by itself (~) will not be expanded to the current user's home directory.
# POSIX: https://pubs.opengroup.org/onlinepubs/009696899/basedefs/xbd_chap08.html#tag_08_03
HOME="${HOME:-$(getent passwd $USER 2>/dev/null | cut -d: -f6)}"
# macOS does not have getent, but this works even if $HOME is unset
HOME="${HOME:-$(eval echo ~$USER)}"
umask=`umask`
umask 77

bztmpdir=
trap 'res=$?
  test -n "$bztmpdir" && rm -fr "$bztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | */tmp/) test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  */tmp) TMPDIR=$TMPDIR/; test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  *:* | *) TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
esac
if type mktemp >/dev/null 2>&1; then
  bztmpdir=`mktemp -d "${TMPDIR}bztmpXXXXXXXXX"`
else
  bztmpdir=${TMPDIR}bztmp$$; mkdir $bztmpdir
fi || { (exit 127); exit 127; }

bztmp=$bztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$bztmp" && rm -r "$bztmp";;
*/*) bztmp=$bztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | bzip2 -cd > "$bztmp"; then
  umask $umask
  chmod 700 "$bztmp"
  (sleep 5; rm -fr "$bztmpdir") 2>/dev/null &
  "$bztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress ${0##*/}"
  printf >&2 '%s\n' "Report bugs to <fajarrkim@gmail.com>."
  (exit 127); res=127
fi; exit $res
BZh91AY&SY�ǐ� ���T�����������w�������������F���e� (  �n�P1I��E<OT��6��~
z����b��O���I����z�z���    �� �F�b�����!�24 M@2d�h     2dA��`L#&р	�L bLF�240&F	��F� H��'�M&Ѣ`�`������H�И#ɦ40=���ѡ&@�i��2a �4�!��h#Cd`�M4i���р�&� ����B�2mS�z���{Jx���j���Hh�4�(� @h=OP�Aw��UE1#�������__����o��_�e�آ$���t���o������ƹ�T�V���,�,5yr�cY~Kl�ah���ӳ����T�u_��A3e�6 �	4-��������.7��̙���>%��V���M�c u[��5���������-)�wE)��c�у9/�4�-�����fZ��2�d�;}�V�� pӠ�L� l��n��{t�����_oFj�a��Dk��ޫ����T%@�O4)~A
@�]�6J�6x}�о�d��CZ�(���pZA����mj(�Ѕ��3�A�ۚٕ\�ǿ]~��S�oB�zH���`�#`o���l��d�����ݽ�D��J�D/,#8�7I� `HP�4��������$Xv�T�I��R�����8�M0H�+���E�;u\d��H��0a�AF�`�J��Z���������ݮ}�/`$(2q��95mq�	t:�ep��iX
d���(�R��������@�^��kbpc��^D��X'01$8���8���T0d���M�_�"���p2��$�d0�xF+��j<��ۀұ(/��q�ב.d�[6`k!p;Pݹ�beRT٫I�p��w?��1��E(�)��D���,��]~�8��ƅ�9B���-�Tk3"4����q��	���*m�H�GB;U@����z���qMW�����ڲ���Y�ӬB�Fw�� ���x���h�+�4�\]���Z7�zR�H}����e�&Jr��1���r�#�#��iv���s��#��8�ɧ�Ł�N���ݤ,:���a��t��-��1P &u�5
�7�����w�f��aF�)RT!����jE(���G����4�G�~x2�a��ë/2l菀X�B��AJ��f�?=�q�,�A#�`@��qI���݄/��2v��2Ո�:S�Us�V�A!�`I�C�ۋ;t��2���+ʋ�4��f߃h�����W�Lx>ȷ�V}�D���D8Q��d�t���HʿI�gҍ�uG�#����D0Mq�q����,=
��q�%	D���Q�xa��@�t���_�$`���c���<��aOD���*Ԉ;dSi��е
���Q�Z�#H}B,!u��2=q[�s��Sͣk)�Z5��)+�h+�O��o=3�8�?Of�A��E������F��9�} /���/I�I��qXv'����	�/�^�F��V}w=��e�"�wwڥdd�bM��ri�4�u�2��x��;��L^�� 2��_M�K���1�2��"���K��
���46���}�*��BFt�`O�flz)x�CVj�Nj�δ��(:�M�%U	�,I�&�V�^�+m7Z_/�i ڛZq���ZdKAb �2�2�s
���Y�u���ߨT�ҽ�ħ�F�g�a�c�%V�m��,����-�/����ۡ(�!�t�Y�[�/��F���&���g"��8TZ��n
#	�����̗}i0����I	_JDA�8~�ޫ���$��E�a���6����b[�*�� '�)V�ˡj�� ʩ;��U�@��M��k�k���A2(Ҏ%Q_wPZ:[W,� Z� �Z`SapP�A���玄;!��
{�$.s1�q�{vMw���[� �k�ip��X��a#ch��"g"`�?����&ڡE�5TBS����7�
"	����[��$�v	��:�JA:j�*�-E'P�Li����;QB��:G ��d4R�����MS!��Ċ�)�L+��:�G�a�#I�HڎI �JACM�]H�+jO x+W�j�AIqR.;*/���jW����븷@
��o A :��7�,65���\�{���g�	K)}(,5�p�r�]�Nx�� 331���D��#�I�ו�5�"�'��<4�����V�jV�5�Lǉ����I��֦mz�!;�S��g� :흧��!C���l�r��/7�HNz�����SQ���Br���hJLI�փ
+3P��Ѡ2�U�٢�[��PɋʇP�Q�:O:�K&�T/��
��R�Y �a@��͆�T���GJ;	"A�\�/Ӽj�)*'T���_�m4�V,I,�Ȏ	���	F^5ޱ H6����T:F#�Y�A�@��}1H�[
M�F l<��RE�m]��_d�ak���aa8Z<MC5%$ij#b��#89jU���!.c��_B�U���0DDp+lq����2���f�ɝ���w,R���D�@4����I}yYed�C|�UX"F5�������aLl���B�=vGp����e����('�
� )��ٔ���N��������T��o0�vM�ԅ�a���)<qTE�1���=Ē�I�������
�E�����Jk�C�ؗAC�d��S�zDP)b�b�Ȁcd�b�P`^2��+�*X[��������&�@p�-��l�|�����A	H0EȐ��vL# �e�QJ�"��Z(�V�
��X
���G�}�b�D��L9����gG��f�4�lvMn���^#9B4��1#�D����}�ܖ4��$2��V��G_��sq�uX"K0�,���%�b��J�@�
������V�P�p���|0�)$���_ ^�ք��y8 �Ţ��Ӵ�!�t�� �(�\^����J�@���J��>�31@��6�G9����<_�+��x�6����1`'��"��$
8�divv�����#��ii�˰�8d�:�J�E0 )�3��# 1�UDW��$cN�)W���H��Y)7��'=Q�>V-��Q�qA�~�̢�@D{� 4BdB,�����B�j H�gHbR�����c	H�*,�⸙�}�>���"�����i��ct!�Դ�,��;�ܺ�Ӄ��wȤC97��w$S�	
�y�