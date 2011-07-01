dnl #
dnl # 2.6.39 API change
dnl # is_owner_or_cap() was renamed to inode_owner_or_capable().
dnl #
AC_DEFUN([ZFS_AC_KERNEL_INODE_OWNER_OR_CAPABLE], [
	AC_MSG_CHECKING([whether inode_owner_or_capable() exists])
	ZFS_LINUX_TRY_COMPILE([
		#include <linux/fs.h>
	],[
		struct inode *ip = NULL;
		inode_owner_or_capable(ip);
	],[
		AC_MSG_RESULT(yes)
		AC_DEFINE(HAVE_INODE_OWNER_OR_CAPABLE, 1, [inode_owner_or_capable() exists])
	],[
		AC_MSG_RESULT(no)
		AC_MSG_CHECKING([whether is_owner_or_cap() exists])
		ZFS_LINUX_TRY_COMPILE([
			#include <linux/fs.h>
		],[
			struct inode *ip = NULL;
			is_owner_or_cap(ip);
		],[
			AC_MSG_RESULT(yes)
			AC_DEFINE(HAVE_IS_OWNER_OR_CAP, 1, [is_owner_or_cap() exists])
		],[
			AC_MSG_ERROR(no; file a bug report with ZFSOnLinux)
		])
	])
])
