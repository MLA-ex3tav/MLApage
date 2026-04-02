-- 1. Agregar las columnas faltantes a la tabla existente
-- Ejecuta esto en el SQL Editor de Supabase

alter table public.usuarios_autorizados 
add column if not exists codigo text,
add column if not exists usado boolean default false;

-- 2. Asegúrate de que las políticas permitan la actualización del código
create policy "Permitir actualización de código para validación"
on public.usuarios_autorizados for update
using (true)
with check (true);
