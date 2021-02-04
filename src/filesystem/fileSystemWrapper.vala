namespace io.github.jorchube.vest
{
    public class FileSystemWrapper : Object, IFileSystemWrapper
    {
        public void writeTextFile(string path, string content)
        {
            FileStream target = FileStream.open(path, "w");

            if (target == null)
            {
                stderr.printf("Unable to create file \"%s\"\n", path);
                return;
            }

            target.puts(content);
        }
    }
}