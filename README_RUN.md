Instrucciones para ejecutar ejercicios Prolog/Haskell desde VSCode

- Hacer ejecutables los scripts (desde la raíz del repo):

```bash
chmod +x scripts/run_prolog.sh scripts/run_haskell.sh
```

- Tareas disponibles en VSCode: abre la paleta `Tasks: Run Task` y elige:
  - `Run current Prolog file` — ejecuta el archivo abierto con `swipl`.
  - `Run current Haskell file` — ejecuta el archivo abierto con `runghc`.
  - `Run all Prolog exercises` — ejecuta todos los `*.pl` dentro de cada subcarpeta.
  - `Run all Haskell exercises` — ejecuta todos los `*.hs` dentro de cada subcarpeta.
  - `Run Prolog exercise (select)` / `Run Haskell exercise (select)` — selecciona la carpeta del ejercicio.

- Notas:
  - Las entradas del selector (`inputs` en `.vscode/tasks.json`) están prellenadas con `ej1` y `ej2`. Añade nuevas opciones cuando agregues más carpetas, o usa la tarea "Run current file".
  - Asegúrate de tener instalados `swipl` y `runghc`/`ghcup` (ver instrucciones anteriores).

- Para actualizar automáticamente las opciones del selector cuando agregues carpetas, hay un script:

```bash
python3 scripts/update_tasks_inputs.py
```

Este script detecta subcarpetas que contienen `*.hs` o `*.pl` y actualiza `.vscode/tasks.json`.
