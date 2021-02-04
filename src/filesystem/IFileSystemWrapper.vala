namespace io.github.jorchube.vest
{
    public interface IFileSystemWrapper : Object
    {
        public abstract void writeTextFile(string path, string content);
    }
}