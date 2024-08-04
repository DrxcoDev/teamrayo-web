defmodule Acceso do
  @moduledoc """
  Módulo para verificar el acceso a una carpeta basándose en un nombre de Discord.
  """

  @archivo "login.txt"
  @carpeta "teamrayo-web"

  def verificar_acceso do
    case File.read(@archivo) do
      {:ok, nombre_discord} ->
        nombre_discord = String.trim(nombre_discord)
        if nombre_discord == "mi_nombre_discord" do
          IO.puts("Acceso concedido. Contenido de la carpeta:")
          listar_contenido_carpeta()
        else
          IO.puts("Acceso denegado. El nombre de Discord no es válido.")
        end

      {:error, reason} ->
        IO.puts("Error al leer el archivo: #{reason}")
    end
  end

  defp listar_contenido_carpeta do
    case File.ls(@carpeta) do
      {:ok, archivos} ->
        Enum.each(archivos, fn archivo ->
          IO.puts(archivo)
        end)

      {:error, reason} ->
        IO.puts("No se pudo acceder a la carpeta: #{reason}")
    end
  end
end

# Ejecutar la verificación
Acceso.verificar_acceso()
