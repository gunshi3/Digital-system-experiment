# -*- mode: python ; coding: utf-8 -*-

block_cipher = None


a = Analysis(['secendstep.py', 'Ui_form.py', 'mplCanvasWrapper.py', 'BL.py'],
             pathex=['D:\\Documents\\大二下\\数字系统实验\\综合实验-201908010705-杨杰\\大实验3\\python工程'],
             binaries=[],
             datas=[],
             hiddenimports=["gi._gobject"],
             hookspath=[],
             runtime_hooks=[],
             excludes=[],
             win_no_prefer_redirects=False,
             win_private_assemblies=False,
             cipher=block_cipher,
             noarchive=False)
pyz = PYZ(a.pure, a.zipped_data,
             cipher=block_cipher)
exe = EXE(pyz,
          a.scripts,
          [],
          exclude_binaries=True,
          name='secendstep',
          debug=False,
          bootloader_ignore_signals=False,
          strip=False,
          upx=True,
          console=False )
coll = COLLECT(exe,
               a.binaries,
               a.zipfiles,
               a.datas,
               strip=False,
               upx=True,
               upx_exclude=[],
               name='secendstep')
