#!/usr/bin/env python3
import json
import os
import sys

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), '..'))

def find_exercise_dirs(root):
    names = []
    for entry in sorted(os.listdir(root)):
        path = os.path.join(root, entry)
        if not os.path.isdir(path):
            continue
        if entry.startswith('.') or entry == 'scripts' or entry == '.vscode':
            continue
        try:
            files = os.listdir(path)
        except Exception:
            continue
        for f in files:
            if f.endswith('.hs') or f.endswith('.pl'):
                names.append(entry)
                break
    return names

def update_tasks_json(root, dirs):
    tpath = os.path.join(root, '.vscode', 'tasks.json')
    if not os.path.exists(tpath):
        print('No existe', tpath)
        return 2
    with open(tpath, 'r', encoding='utf-8') as f:
        data = json.load(f)

    updated = False
    inputs = data.get('inputs', [])
    for inp in inputs:
        if inp.get('id') == 'exercise' and inp.get('type') == 'pickString':
            inp['options'] = dirs
            if dirs:
                inp['default'] = dirs[0]
            updated = True
            break

    if not updated:
        inputs.append({
            'id': 'exercise',
            'type': 'pickString',
            'description': 'Seleccione la carpeta del ejercicio',
            'options': dirs,
            'default': dirs[0] if dirs else ''
        })
        data['inputs'] = inputs

    with open(tpath, 'w', encoding='utf-8') as f:
        json.dump(data, f, indent=2, ensure_ascii=False)
    print('Actualizado', tpath)
    print('Opciones:', dirs)
    return 0

def main():
    dirs = find_exercise_dirs(ROOT)
    return update_tasks_json(ROOT, dirs)

if __name__ == '__main__':
    sys.exit(main())
